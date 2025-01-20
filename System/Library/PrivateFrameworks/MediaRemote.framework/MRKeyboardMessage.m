@interface MRKeyboardMessage
+ (id)encryptedMessageWithState:(unint64_t)a3 text:(id)a4 attributes:(id)a5 usingCryptoSession:(id)a6;
- (MRKeyboardMessage)initWithState:(unint64_t)a3 encryptedTextCyphertext:(id)a4 attributes:(id)a5;
- (MRTextEditingAttributes)attributes;
- (NSData)encryptedTextCyphertext;
- (id)decryptedTextUsingCryptoSession:(id)a3;
- (unint64_t)state;
- (unint64_t)type;
@end

@implementation MRKeyboardMessage

+ (id)encryptedMessageWithState:(unint64_t)a3 text:(id)a4 attributes:(id)a5 usingCryptoSession:(id)a6
{
  id v8 = a5;
  v9 = [a4 dataUsingEncoding:4];
  v10 = [[MRKeyboardMessage alloc] initWithState:a3 encryptedTextCyphertext:v9 attributes:v8];

  return v10;
}

- (MRKeyboardMessage)initWithState:(unint64_t)a3 encryptedTextCyphertext:(id)a4 attributes:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MRKeyboardMessage;
  v10 = [(MRProtocolMessage *)&v27 init];
  if (v10)
  {
    uint64_t v11 = [v9 copy];
    attributes = v10->_attributes;
    v10->_attributes = (MRTextEditingAttributes *)v11;

    v13 = objc_alloc_init(_MRKeyboardMessageProtobuf);
    [(_MRKeyboardMessageProtobuf *)v13 setState:a3];
    [(_MRKeyboardMessageProtobuf *)v13 setEncryptedTextCyphertext:v8];
    id v14 = v9;
    v15 = objc_alloc_init(_MRTextEditingAttributesProtobuf);
    v16 = [v14 title];
    [(_MRTextEditingAttributesProtobuf *)v15 setTitle:v16];

    v17 = [v14 prompt];
    [(_MRTextEditingAttributesProtobuf *)v15 setPrompt:v17];

    if (v14)
    {
      [v14 inputTraits];
    }
    else
    {
      unint64_t v32 = 0;
      long long v30 = 0u;
      memset(v31, 0, sizeof(v31));
      long long v28 = 0u;
      long long v29 = 0u;
    }
    v18 = objc_alloc_init(_MRTextInputTraitsProtobuf);
    v19 = v18;
    if ((v28 - 1) >= 3) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = v28;
    }
    [(_MRTextInputTraitsProtobuf *)v18 setAutocapitalizationType:v20];
    uint64_t v21 = 0;
    if ((HIDWORD(v28) - 1) <= 0xA) {
      uint64_t v21 = dword_195224610[HIDWORD(v28) - 1];
    }
    [(_MRTextInputTraitsProtobuf *)v19 setKeyboardType:v21];
    if ((v29 - 1) >= 0xB) {
      uint64_t v22 = 0;
    }
    else {
      uint64_t v22 = v29;
    }
    [(_MRTextInputTraitsProtobuf *)v19 setReturnKeyType:v22];
    [(_MRTextInputTraitsProtobuf *)v19 setEnablesReturnKeyAutomatically:BYTE8(v30)];
    [(_MRTextInputTraitsProtobuf *)v19 setSecureTextEntry:BYTE9(v30)];
    if (DWORD1(v28)) {
      [(_MRTextInputTraitsProtobuf *)v19 setAutocorrection:DWORD1(v28) == 2];
    }
    if (DWORD2(v28)) {
      [(_MRTextInputTraitsProtobuf *)v19 setSpellchecking:DWORD2(v28) == 2];
    }
    [(_MRTextInputTraitsProtobuf *)v19 setValidTextRangeLocation:*((void *)&v29 + 1)];
    [(_MRTextInputTraitsProtobuf *)v19 setValidTextRangeLength:(void)v30];
    if (v32)
    {
      uint64_t v23 = 0;
      unsigned int v24 = 1;
      do
      {
        [(_MRTextInputTraitsProtobuf *)v19 addPINEntrySeparatorIndexes:*((void *)v31 + v23)];
        uint64_t v23 = v24;
      }
      while (v32 > v24++);
    }
    [(_MRTextEditingAttributesProtobuf *)v15 setInputTraits:v19];

    [(_MRKeyboardMessageProtobuf *)v13 setAttributes:v15];
    [(MRProtocolMessage *)v10 setUnderlyingCodableMessage:v13];
  }
  return v10;
}

- (unint64_t)state
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v3 = (int)[v2 state];

  return v3;
}

- (NSData)encryptedTextCyphertext
{
  v2 = [(MRProtocolMessage *)self underlyingCodableMessage];
  unint64_t v3 = [v2 encryptedTextCyphertext];

  return (NSData *)v3;
}

- (MRTextEditingAttributes)attributes
{
  attributes = self->_attributes;
  if (!attributes)
  {
    objc_super v27 = [(MRProtocolMessage *)self underlyingCodableMessage];
    v4 = [v27 attributes];
    v5 = objc_alloc_init(MRMutableTextEditingAttributes);
    v6 = [v4 title];
    [(MRMutableTextEditingAttributes *)v5 setTitle:v6];

    v7 = [v4 prompt];
    [(MRMutableTextEditingAttributes *)v5 setPrompt:v7];

    id v8 = [v4 inputTraits];
    memset((char *)v30 + 8, 0, 128);
    int v9 = [v8 autocapitalizationType];
    if ((v9 - 1) >= 3) {
      int v10 = 0;
    }
    else {
      int v10 = v9;
    }
    LODWORD(v30[0]) = v10;
    int v11 = [v8 keyboardType];
    int v12 = 0;
    if ((v11 - 1) <= 0xB) {
      int v12 = dword_19522463C[v11 - 1];
    }
    HIDWORD(v30[0]) = v12;
    int v13 = [v8 returnKeyType];
    if ((v13 - 1) >= 0xB) {
      int v14 = 0;
    }
    else {
      int v14 = v13;
    }
    LODWORD(v30[1]) = v14;
    BYTE8(v30[2]) = [v8 enablesReturnKeyAutomatically];
    BYTE9(v30[2]) = [v8 secureTextEntry];
    int v15 = [v8 hasAutocorrection];
    int v16 = 0;
    if (v15)
    {
      if ([v8 autocorrection]) {
        int v16 = 2;
      }
      else {
        int v16 = 1;
      }
    }
    DWORD1(v30[0]) = v16;
    if ([v8 hasSpellchecking])
    {
      if ([v8 spellchecking]) {
        int v17 = 2;
      }
      else {
        int v17 = 1;
      }
    }
    else
    {
      int v17 = 0;
    }
    DWORD2(v30[0]) = v17;
    if ([v8 hasValidTextRangeLocation]
      && [v8 hasValidTextRangeLength])
    {
      uint64_t v18 = [v8 validTextRangeLocation];
      uint64_t v19 = [v8 validTextRangeLength];
      *((void *)&v30[1] + 1) = v18;
    }
    else
    {
      *((void *)&v30[1] + 1) = 0;
      uint64_t v19 = -1;
    }
    *(void *)&v30[2] = v19;
    uint64_t v20 = [v8 pINEntrySeparatorIndexesCount];
    *(void *)&v30[8] = v20;
    if (v20)
    {
      unint64_t v21 = v20;
      uint64_t v22 = 0;
      unsigned int v23 = 1;
      do
      {
        *((void *)&v30[3] + v22) = [v8 pINEntrySeparatorIndexesAtIndex:v22];
        uint64_t v22 = v23;
      }
      while (v21 > v23++);
    }

    v28[6] = v30[6];
    v28[7] = v30[7];
    uint64_t v29 = *(void *)&v30[8];
    v28[2] = v30[2];
    v28[3] = v30[3];
    v28[4] = v30[4];
    v28[5] = v30[5];
    v28[0] = v30[0];
    v28[1] = v30[1];
    [(MRMutableTextEditingAttributes *)v5 setInputTraits:v28];

    v25 = self->_attributes;
    self->_attributes = &v5->super;

    attributes = self->_attributes;
  }

  return attributes;
}

- (unint64_t)type
{
  return 23;
}

- (id)decryptedTextUsingCryptoSession:(id)a3
{
  unint64_t v3 = [(MRKeyboardMessage *)self encryptedTextCyphertext];
  v4 = (void *)[[NSString alloc] initWithData:v3 encoding:4];

  return v4;
}

- (void).cxx_destruct
{
}

@end