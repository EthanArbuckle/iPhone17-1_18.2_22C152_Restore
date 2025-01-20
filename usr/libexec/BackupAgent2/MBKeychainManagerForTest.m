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
  return (id)qword_100113070;
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
  v3 = (void *)qword_100113070;
  qword_100113070 = 0;

  return 1;
}

+ (id)fetchKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  return [qword_100113078 objectForKeyedSubscript:a3, a4];
}

+ (BOOL)addKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)qword_100113078;
  if (!qword_100113078)
  {
    uint64_t v9 = +[NSMutableDictionary dictionary];
    v10 = (void *)qword_100113078;
    qword_100113078 = v9;

    v8 = (void *)qword_100113078;
  }
  [v8 setObject:v6 forKeyedSubscript:v7];

  return 1;
}

+ (BOOL)updateKeybagSecret:(id)a3 forUUID:(id)a4 error:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)qword_100113078;
  if (!qword_100113078)
  {
    uint64_t v9 = +[NSMutableDictionary dictionary];
    v10 = (void *)qword_100113078;
    qword_100113078 = v9;

    v8 = (void *)qword_100113078;
  }
  [v8 setObject:v6 forKeyedSubscript:v7];

  return 1;
}

+ (BOOL)removeKeybagSecretsWithError:(id *)a3
{
  v3 = (void *)qword_100113078;
  qword_100113078 = 0;

  return 1;
}

+ (BOOL)removeKeybagSecretForUUID:(id)a3 error:(id *)a4
{
  return 1;
}

@end