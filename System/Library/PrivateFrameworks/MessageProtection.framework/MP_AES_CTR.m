@interface MP_AES_CTR
+ (id)crypt:(id)a3 key:(id)a4 IV:(id)a5;
@end

@implementation MP_AES_CTR

+ (id)crypt:(id)a3 key:(id)a4 IV:(id)a5
{
  v7 = (objc_class *)MEMORY[0x263EFF990];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_msgSend([v7 alloc], "initWithLength:", objc_msgSend(v10, "length"));
  ccaes_ctr_crypt_mode();
  [v9 length];
  id v12 = v9;
  [v12 bytes];

  id v13 = v8;
  [v13 bytes];

  [v10 length];
  id v14 = v10;
  [v14 bytes];

  id v15 = v11;
  [v15 bytes];
  if (ccctr_one_shot()) {
    id v16 = 0;
  }
  else {
    id v16 = v15;
  }

  return v16;
}

@end