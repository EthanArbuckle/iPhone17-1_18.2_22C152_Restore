@interface OADMasterBackground
+ (id)masterBackground;
- (BOOL)isEqual:(id)a3;
- (unint64_t)hash;
@end

@implementation OADMasterBackground

+ (id)masterBackground
{
  v2 = (void *)+[OADMasterBackground masterBackground]::theMasterBackground;
  if (!+[OADMasterBackground masterBackground]::theMasterBackground)
  {
    v3 = objc_alloc_init(OADMasterBackground);
    v4 = (void *)+[OADMasterBackground masterBackground]::theMasterBackground;
    +[OADMasterBackground masterBackground]::theMasterBackground = (uint64_t)v3;

    v2 = (void *)+[OADMasterBackground masterBackground]::theMasterBackground;
  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isMemberOfClass:objc_opt_class()];

  return v4;
}

- (unint64_t)hash
{
  v3.receiver = self;
  v3.super_class = (Class)OADMasterBackground;
  return [(OADMasterBackground *)&v3 hash];
}

@end