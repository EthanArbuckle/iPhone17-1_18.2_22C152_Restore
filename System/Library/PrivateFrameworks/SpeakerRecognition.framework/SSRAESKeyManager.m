@interface SSRAESKeyManager
+ (BOOL)deleteAESKeyWithApplicationTag:(id)a3 keyLabel:(id)a4;
+ (BOOL)storeAESKeyInKeychain:(id)a3 applicationTag:(id)a4 keyLabel:(id)a5;
+ (id)generateAESKeyWithKeySizeInBits:(unint64_t)a3;
+ (id)generateIfNecessaryAESKeyWithKeySizeInBits:(unint64_t)a3 applicationTag:(id)a4 keyLabel:(id)a5 shouldGenerateIfNecessary:(BOOL)a6;
+ (id)generateIfNecessaryVoiceTriggerProfilesAESKey;
+ (id)getAESKeyFromKeychainWithApplicationTag:(id)a3 keyLabel:(id)a4;
+ (id)getKeychainAttributesForAESKeyWithApplicationTag:(id)a3 keyLabel:(id)a4;
+ (id)getVoiceTriggerProfilesAESKey;
@end

@implementation SSRAESKeyManager

+ (id)getKeychainAttributesForAESKeyWithApplicationTag:(id)a3 keyLabel:(id)a4
{
  return 0;
}

+ (BOOL)deleteAESKeyWithApplicationTag:(id)a3 keyLabel:(id)a4
{
  return 0;
}

+ (id)getAESKeyFromKeychainWithApplicationTag:(id)a3 keyLabel:(id)a4
{
  return 0;
}

+ (BOOL)storeAESKeyInKeychain:(id)a3 applicationTag:(id)a4 keyLabel:(id)a5
{
  return 0;
}

+ (id)generateAESKeyWithKeySizeInBits:(unint64_t)a3
{
  return 0;
}

+ (id)generateIfNecessaryAESKeyWithKeySizeInBits:(unint64_t)a3 applicationTag:(id)a4 keyLabel:(id)a5 shouldGenerateIfNecessary:(BOOL)a6
{
  return 0;
}

+ (id)generateIfNecessaryVoiceTriggerProfilesAESKey
{
  return 0;
}

+ (id)getVoiceTriggerProfilesAESKey
{
  return 0;
}

@end