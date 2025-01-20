@interface FCCKTestRecordNameCipher
- (id)decryptRecordName:(id)a3 withKey:(id)a4;
- (id)encryptRecordName:(id)a3 withKey:(id)a4;
@end

@implementation FCCKTestRecordNameCipher

- (id)encryptRecordName:(id)a3 withKey:(id)a4
{
  v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithData:v6 encoding:4];

  v9 = [v7 stringByAppendingString:v8];

  return v9;
}

- (id)decryptRecordName:(id)a3 withKey:(id)a4
{
  v5 = (objc_class *)NSString;
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithData:v6 encoding:4];

  v9 = [v7 stringByReplacingOccurrencesOfString:v8 withString:&stru_1EF8299B8];

  return v9;
}

@end