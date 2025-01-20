@interface ULEncryption
+ (BOOL)decryptFile:(id)a3 destinationPath:(id)a4 keyLabel:(id)a5 keychainClass:(Class)a6;
+ (BOOL)encryptFile:(id)a3 destinationPath:(id)a4 keyLabel:(id)a5 keychainClass:(Class)a6;
+ (id)decryptData:(id)a3 keyLabel:(id)a4;
+ (id)encryptData:(id)a3 keyLabel:(id)a4;
- (_TtC19MicroLocationDaemon12ULEncryption)init;
@end

@implementation ULEncryption

+ (BOOL)encryptFile:(id)a3 destinationPath:(id)a4 keyLabel:(id)a5 keychainClass:(Class)a6
{
  return sub_2564D025C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_s19MicroLocationDaemon12ULEncryptionC11encryptFile_15destinationPath8keyLabel13keychainClassSbSS_S2SyXlXptFZ_0);
}

+ (BOOL)decryptFile:(id)a3 destinationPath:(id)a4 keyLabel:(id)a5 keychainClass:(Class)a6
{
  return sub_2564D025C((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))_s19MicroLocationDaemon12ULEncryptionC11decryptFile_15destinationPath8keyLabel13keychainClassSbSS_S2SyXlXptFZ_0);
}

+ (id)encryptData:(id)a3 keyLabel:(id)a4
{
  return sub_2564D04BC((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t))_s19MicroLocationDaemon12ULEncryptionC11encryptData_8keyLabel10Foundation0F0VSgAH_SStFZ_0);
}

+ (id)decryptData:(id)a3 keyLabel:(id)a4
{
  return sub_2564D04BC((uint64_t)a1, (uint64_t)a2, a3, a4, _s19MicroLocationDaemon12ULEncryptionC11decryptData_8keyLabel10Foundation0F0VSgAH_SStFZ_0);
}

- (_TtC19MicroLocationDaemon12ULEncryption)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ULEncryption();
  return [(ULEncryption *)&v3 init];
}

@end