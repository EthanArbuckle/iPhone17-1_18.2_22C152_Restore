@interface MTSyncInfo
+ (id)predicateForHasNoInverseRelation;
+ (id)predicateForIsCurrentlySyncable:(BOOL)a3;
@end

@implementation MTSyncInfo

+ (id)predicateForHasNoInverseRelation
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == NULL && %K == NULL && %K == NULL", @"episode", @"playlist", @"podcast");
}

+ (id)predicateForIsCurrentlySyncable:(BOOL)a3
{
  if (a3) {
    v3 = @"%K == %@";
  }
  else {
    v3 = @"%K != %@";
  }
  v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", v3, @"syncability", &unk_1F03D7F68);
  return v4;
}

@end