@interface NRDLDKeys
+ (BOOL)supportsSecureCoding;
- (NRDLDKeys)initWithCoder:(id)a3;
@end

@implementation NRDLDKeys

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dhLocalPrivate, 0);
  objc_storeStrong((id *)&self->_dhLocalPublic, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_localPrivateKey, 0);
  objc_storeStrong((id *)&self->_localPublicKey, 0);

  objc_storeStrong((id *)&self->_remotePublicKey, 0);
}

- (NRDLDKeys)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"remotePublicKey"];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    id v8 = [v7 length];
    if (v8) {
      id v9 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v7 bytes], v8);
    }
    else {
      id v9 = objc_alloc_init((Class)NSData);
    }
    v10 = v9;
  }
  else
  {
    v10 = 0;
  }
  if (self) {
    objc_storeStrong((id *)&self->_remotePublicKey, v10);
  }
  if (v6) {

  }
  v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localPublicKey"];
  v12 = v11;
  if (v11)
  {
    id v13 = v11;
    id v14 = [v13 length];
    if (v14) {
      id v15 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v13 bytes], v14);
    }
    else {
      id v15 = objc_alloc_init((Class)NSData);
    }
    v16 = v15;
  }
  else
  {
    v16 = 0;
  }
  if (self) {
    objc_storeStrong((id *)&self->_localPublicKey, v16);
  }
  if (v12) {

  }
  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localPrivateKey"];
  v18 = v17;
  if (v17)
  {
    id v19 = v17;
    id v20 = [v19 length];
    if (v20) {
      id v21 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v19 bytes], v20);
    }
    else {
      id v21 = objc_alloc_init((Class)NSData);
    }
    v22 = v21;
  }
  else
  {
    v22 = 0;
  }
  if (self) {
    objc_storeStrong((id *)&self->_localPrivateKey, v22);
  }
  if (v18) {

  }
  v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sharedSecret"];
  v24 = v23;
  if (v23)
  {
    id v25 = v23;
    id v26 = [v25 length];
    if (v26) {
      id v27 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v25 bytes], v26);
    }
    else {
      id v27 = objc_alloc_init((Class)NSData);
    }
    v28 = v27;
  }
  else
  {
    v28 = 0;
  }
  if (self) {
    objc_storeStrong((id *)&self->_sharedSecret, v28);
  }
  if (v24) {

  }
  v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dhLocalPublic"];
  v30 = v29;
  if (v29)
  {
    id v31 = v29;
    id v32 = [v31 length];
    if (v32) {
      id v33 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v31 bytes], v32);
    }
    else {
      id v33 = objc_alloc_init((Class)NSData);
    }
    v34 = v33;
  }
  else
  {
    v34 = 0;
  }
  if (self) {
    objc_storeStrong((id *)&self->_dhLocalPublic, v34);
  }
  if (v30) {

  }
  v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dhLocalPrivate"];
  v36 = v35;
  if (v35)
  {
    id v37 = v35;
    id v38 = [v37 length];
    if (v38) {
      id v39 = +[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", [v37 bytes], v38);
    }
    else {
      id v39 = objc_alloc_init((Class)NSData);
    }
    v40 = v39;
  }
  else
  {
    v40 = 0;
  }
  if (self) {
    objc_storeStrong((id *)&self->_dhLocalPrivate, v40);
  }
  if (v36) {

  }
  return self;
}

@end