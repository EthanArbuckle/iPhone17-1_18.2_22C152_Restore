@interface MBKeychainManagerForTest
+ (BOOL)addKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5;
+ (BOOL)addLocalBackupPassword:(id)a3 error:(id *)a4;
+ (BOOL)removeKeybagSecretForUUID:(id)a3 error:(id *)a4;
+ (BOOL)removeKeybagSecretsWithError:(id *)a3;
+ (BOOL)removeLocalBackupPassword:(id *)a3;
+ (BOOL)updateKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5;
+ (BOOL)updateLocalBackupPassword:(id)a3 error:(id *)a4;
+ (id)fetchKeybagSecretForUUID:(id)a3 error:(id *)a4;
+ (id)fetchLocalBackupPassword:(id *)a3;
@end

@implementation MBKeychainManagerForTest

+ (id)fetchLocalBackupPassword:(id *)a3
{
  return (id)qword_1004827D0;
}

+ (BOOL)addLocalBackupPassword:(id)a3 error:(id *)a4
{
  return 1;
}

+ (BOOL)updateLocalBackupPassword:(id)a3 error:(id *)a4
{
  return 1;
}

+ (BOOL)removeLocalBackupPassword:(id *)a3
{
  v3 = (void *)qword_1004827D0;
  qword_1004827D0 = 0;

  return 1;
}

+ (id)fetchKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  return objc_msgSend((id)qword_1004827D8, "objectForKeyedSubscript:", a3, a4);
}

+ (BOOL)addKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)qword_1004827D8;
  if (!qword_1004827D8)
  {
    uint64_t v9 = +[NSMutableDictionary dictionary];
    v10 = (void *)qword_1004827D8;
    qword_1004827D8 = v9;

    v8 = (void *)qword_1004827D8;
  }
  [v8 setObject:v6 forKeyedSubscript:v7];

  return 1;
}

+ (BOOL)updateKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)qword_1004827D8;
  if (!qword_1004827D8)
  {
    uint64_t v9 = +[NSMutableDictionary dictionary];
    v10 = (void *)qword_1004827D8;
    qword_1004827D8 = v9;

    v8 = (void *)qword_1004827D8;
  }
  [v8 setObject:v6 forKeyedSubscript:v7];

  return 1;
}

+ (BOOL)removeKeybagSecretsWithError:(id *)a3
{
  v3 = (void *)qword_1004827D8;
  qword_1004827D8 = 0;

  return 1;
}

+ (BOOL)removeKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  return 1;
}

@end