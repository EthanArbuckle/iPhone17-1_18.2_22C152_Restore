@interface NAUITextStyleDescriptor
+ (id)defaultFontForTextStyleDescriptor:(id)a3;
+ (id)descriptorWithTextStyle:(id)a3;
+ (id)fontWithTextStyleDescriptor:(id)a3;
- (BOOL)allowsAccessibilitySizes;
- (BOOL)allowsSmallSizes;
- (BOOL)isEqual:(id)a3;
- (NAUITextStyleDescriptor)init;
- (NAUITextStyleDescriptor)initWithTextStyle:(id)a3 symbolicTraits:(unsigned int)a4 allowsAccessibilitySizes:(BOOL)a5 allowsSmallSizes:(BOOL)a6;
- (NSString)textStyle;
- (id)description;
- (id)descriptorByAddingSymbolicTraits:(unsigned int)a3 removingSymbolicTraits:(unsigned int)a4;
- (id)descriptorByDisallowingAccessibilitySizes;
- (id)descriptorByDisallowingSmallSizes;
- (unint64_t)hash;
- (unsigned)symbolicTraits;
@end

@implementation NAUITextStyleDescriptor

+ (id)descriptorWithTextStyle:(id)a3
{
  id v3 = a3;
  v4 = [[NAUITextStyleDescriptor alloc] initWithTextStyle:v3 symbolicTraits:0 allowsAccessibilitySizes:1 allowsSmallSizes:1];

  return v4;
}

- (id)descriptorByAddingSymbolicTraits:(unsigned int)a3 removingSymbolicTraits:(unsigned int)a4
{
  uint64_t v5 = [(NAUITextStyleDescriptor *)self symbolicTraits] & ~a4 | a3;
  v6 = [NAUITextStyleDescriptor alloc];
  v7 = [(NAUITextStyleDescriptor *)self textStyle];
  v8 = [(NAUITextStyleDescriptor *)v6 initWithTextStyle:v7 symbolicTraits:v5 allowsAccessibilitySizes:[(NAUITextStyleDescriptor *)self allowsAccessibilitySizes] allowsSmallSizes:[(NAUITextStyleDescriptor *)self allowsSmallSizes]];

  return v8;
}

- (id)descriptorByDisallowingAccessibilitySizes
{
  id v3 = [NAUITextStyleDescriptor alloc];
  v4 = [(NAUITextStyleDescriptor *)self textStyle];
  uint64_t v5 = [(NAUITextStyleDescriptor *)v3 initWithTextStyle:v4 symbolicTraits:[(NAUITextStyleDescriptor *)self symbolicTraits] allowsAccessibilitySizes:0 allowsSmallSizes:[(NAUITextStyleDescriptor *)self allowsSmallSizes]];

  return v5;
}

- (id)descriptorByDisallowingSmallSizes
{
  id v3 = [NAUITextStyleDescriptor alloc];
  v4 = [(NAUITextStyleDescriptor *)self textStyle];
  uint64_t v5 = [(NAUITextStyleDescriptor *)v3 initWithTextStyle:v4 symbolicTraits:[(NAUITextStyleDescriptor *)self symbolicTraits] allowsAccessibilitySizes:[(NAUITextStyleDescriptor *)self allowsAccessibilitySizes] allowsSmallSizes:0];

  return v5;
}

+ (id)fontWithTextStyleDescriptor:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 allowsAccessibilitySizes] ^ 1;
  if (![v3 allowsSmallSizes]) {
    v4 |= 2uLL;
  }
  uint64_t v5 = (void *)MEMORY[0x263F81720];
  v6 = [v3 textStyle];
  uint64_t v7 = [v3 symbolicTraits];

  v8 = [v5 preferredFontDescriptorWithTextStyle:v6 addingSymbolicTraits:v7 options:v4];

  v9 = [MEMORY[0x263F81708] fontWithDescriptor:v8 size:0.0];

  return v9;
}

+ (id)defaultFontForTextStyleDescriptor:(id)a3
{
  if (a3)
  {
    id v3 = (void *)MEMORY[0x263F81708];
    uint64_t v4 = [a3 textStyle];
    uint64_t v5 = [v3 defaultFontForTextStyle:v4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (NAUITextStyleDescriptor)init
{
  return 0;
}

- (NAUITextStyleDescriptor)initWithTextStyle:(id)a3 symbolicTraits:(unsigned int)a4 allowsAccessibilitySizes:(BOOL)a5 allowsSmallSizes:(BOOL)a6
{
  id v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NAUITextStyleDescriptor;
  v12 = [(NAUITextStyleDescriptor *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_textStyle, a3);
    v13->_symbolicTraits = a4;
    v13->_allowsAccessibilitySizes = a5;
    v13->_allowsSmallSizes = a6;
  }

  return v13;
}

id __38__NAUITextStyleDescriptor_na_identity__block_invoke()
{
  if (_block_invoke_na_once_token_6 != -1) {
    dispatch_once(&_block_invoke_na_once_token_6, &__block_literal_global_5);
  }
  v0 = (void *)_block_invoke_na_once_object_6;
  return v0;
}

void __38__NAUITextStyleDescriptor_na_identity__block_invoke_2()
{
  id v6 = [MEMORY[0x263F58198] builder];
  v0 = [v6 appendCharacteristic:&__block_literal_global_9];
  v1 = [v0 appendCharacteristic:&__block_literal_global_11];
  v2 = [v1 appendCharacteristic:&__block_literal_global_14];
  id v3 = [v2 appendCharacteristic:&__block_literal_global_16];
  uint64_t v4 = [v3 build];
  uint64_t v5 = (void *)_block_invoke_na_once_object_6;
  _block_invoke_na_once_object_6 = v4;
}

uint64_t __38__NAUITextStyleDescriptor_na_identity__block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 textStyle];
}

uint64_t __38__NAUITextStyleDescriptor_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 symbolicTraits];
  return [v2 numberWithUnsignedInt:v3];
}

uint64_t __38__NAUITextStyleDescriptor_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 allowsAccessibilitySizes];
  return [v2 numberWithBool:v3];
}

uint64_t __38__NAUITextStyleDescriptor_na_identity__block_invoke_6(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 allowsSmallSizes];
  return [v2 numberWithBool:v3];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  uint64_t v4 = [(NAUITextStyleDescriptor *)self textStyle];
  [v3 appendString:v4 withName:@"textStyle" skipIfEmpty:0];

  id v5 = (id)[v3 appendSuper];
  id v6 = (id)[v3 appendBool:self->_allowsSmallSizes withName:@"allowsSmallSizes"];
  id v7 = (id)[v3 appendBool:self->_allowsAccessibilitySizes withName:&stru_26D4E99A0];
  id v8 = (id)[v3 appendUnsignedInteger:self->_symbolicTraits withName:@"custom-traits"];
  v9 = [v3 build];

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_opt_class(), "na_identity");
  unint64_t v4 = [v3 hashOfObject:self];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_opt_class(), "na_identity");
  LOBYTE(self) = [v5 isObject:self equalToObject:v4];

  return (char)self;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (unsigned)symbolicTraits
{
  return self->_symbolicTraits;
}

- (BOOL)allowsAccessibilitySizes
{
  return self->_allowsAccessibilitySizes;
}

- (BOOL)allowsSmallSizes
{
  return self->_allowsSmallSizes;
}

- (void).cxx_destruct
{
}

@end