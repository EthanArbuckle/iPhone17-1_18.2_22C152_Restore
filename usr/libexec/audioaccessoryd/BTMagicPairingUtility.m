@interface BTMagicPairingUtility
- (id)cipherBluetoothAddress:(id)a3;
- (id)magicPairingDecryptDataWithKey:(id)a3 payload:(id)a4 length:(unint64_t)a5;
- (id)magicPairingEncryptDataWithKey:(id)a3 payload:(id)a4;
@end

@implementation BTMagicPairingUtility

- (id)cipherBluetoothAddress:(id)a3
{
  __int16 v12 = 0;
  int v11 = 0;
  v3 = [a3 bytes];
  *(_DWORD *)v8 = *(_DWORD *)v3;
  *(_WORD *)&v8[4] = v3[2];
  __int16 v10 = *(_WORD *)&v8[4];
  int v9 = *(_DWORD *)v8;
  uint64_t v4 = 6;
  for (uint64_t i = 5; i != -1; --i)
    *((unsigned char *)&v9 + v4++) = v8[i];
  int v13 = *(_DWORD *)&v8[1] ^ *(_DWORD *)v8;
  v6 = +[NSData dataWithBytes:&v9 length:16];

  return v6;
}

- (id)magicPairingEncryptDataWithKey:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  ccaes_ecb_encrypt_mode();
  v15[0] = 0;
  v15[1] = 0;
  id v7 = v6;
  [v7 bytes];

  id v8 = v5;
  [v8 bytes];

  int v9 = ccecb_one_shot();
  if (v9)
  {
    int v10 = v9;
    int v11 = sub_10006CA04("BTMagicPairingUtility");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 67109120;
      v14[1] = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Unable to encrypt key with error code: %d", (uint8_t *)v14, 8u);
    }

    __int16 v12 = 0;
  }
  else
  {
    __int16 v12 = +[NSData dataWithBytes:v15 length:16];
  }

  return v12;
}

- (id)magicPairingDecryptDataWithKey:(id)a3 payload:(id)a4 length:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  ccaes_ecb_decrypt_mode();
  v17[0] = 0;
  v17[1] = 0;
  id v9 = v8;
  [v9 bytes];

  id v10 = v7;
  [v10 bytes];

  int v11 = ccecb_one_shot();
  if (v11)
  {
    int v12 = v11;
    int v13 = sub_10006CA04("BTMagicPairingUtility");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v16[0] = 67109120;
      v16[1] = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Unable to decrypt key with error code: %d", (uint8_t *)v16, 8u);
    }

    v14 = 0;
  }
  else
  {
    v14 = +[NSData dataWithBytes:v17 length:a5];
  }

  return v14;
}

@end