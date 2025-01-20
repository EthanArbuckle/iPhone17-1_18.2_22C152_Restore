@interface SFWrappedKeyCiphertext
- (SFWrappedKeyCiphertext)initWithCiphertext:(id)a3 ciphertextKey:(id)a4;
- (_SFCiphertext)ciphertextKey;
@end

@implementation SFWrappedKeyCiphertext

- (SFWrappedKeyCiphertext)initWithCiphertext:(id)a3 ciphertextKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 338, @"Invalid parameter not satisfying: %@", @"ciphertext" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v14 = [MEMORY[0x1E4F28B00] currentHandler];
  [v14 handleFailureInMethod:a2, self, @"SFEncryptionOperation.m", 339, @"Invalid parameter not satisfying: %@", @"ciphertextKey" object file lineNumber description];

LABEL_3:
  v15.receiver = self;
  v15.super_class = (Class)SFWrappedKeyCiphertext;
  v10 = [(_SFCiphertext *)&v15 initWithCiphertext:v7];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)v10->_wrappedKeyCiphertextInternal + 1, a4);
  }

  return v11;
}

- (_SFCiphertext)ciphertextKey
{
  return (_SFCiphertext *)*((id *)self->_wrappedKeyCiphertextInternal + 1);
}

- (void).cxx_destruct
{
}

@end