@interface SCRO2DBrailleData
+ (BOOL)supportsSecureCoding;
- (BOOL)alignAtTop;
- (BOOL)truncateStrings;
- (NSArray)strings;
- (NSData)imageData;
- (SCRO2DBrailleData)initWithCoder:(id)a3;
- (SCRO2DBrailleData)initWithImageData:(id)a3;
- (SCRO2DBrailleData)initWithStrings:(id)a3 focusedIndex:(int64_t)a4 truncateStrings:(BOOL)a5 alignAtTop:(BOOL)a6;
- (int64_t)focusedIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SCRO2DBrailleData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCRO2DBrailleData)initWithCoder:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SCRO2DBrailleData;
  v5 = [(SCRO2DBrailleData *)&v16 init];
  if (v5)
  {
    v6 = (void *)MEMORY[0x263EFFA08];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"strings"];
    strings = v5->_strings;
    v5->_strings = (NSArray *)v9;

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"focusedIndex"];
    v5->_focusedIndex = [v11 integerValue];

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v12;

    v5->_truncateStrings = [v4 decodeBoolForKey:@"truncateStrings"];
    v5->_alignAtTop = [v4 decodeBoolForKey:@"alignAtTop"];
    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  strings = self->_strings;
  id v6 = a3;
  [v6 encodeObject:strings forKey:@"strings"];
  v5 = [NSNumber numberWithInteger:self->_focusedIndex];
  [v6 encodeObject:v5 forKey:@"focusedIndex"];

  [v6 encodeObject:self->_imageData forKey:@"imageData"];
  [v6 encodeBool:self->_truncateStrings forKey:@"truncateStrings"];
  [v6 encodeBool:self->_alignAtTop forKey:@"alignAtTop"];
}

- (SCRO2DBrailleData)initWithStrings:(id)a3 focusedIndex:(int64_t)a4 truncateStrings:(BOOL)a5 alignAtTop:(BOOL)a6
{
  id v11 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCRO2DBrailleData;
  uint64_t v12 = [(SCRO2DBrailleData *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_strings, a3);
    int64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    if ((a4 & 0x8000000000000000) == 0 && [v11 count] > (unint64_t)a4) {
      int64_t v14 = a4;
    }
    v13->_focusedIndex = v14;
    v13->_truncateStrings = a5;
    v13->_alignAtTop = a6;
    v15 = v13;
  }

  return v13;
}

- (SCRO2DBrailleData)initWithImageData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCRO2DBrailleData;
  id v6 = [(SCRO2DBrailleData *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageData, a3);
    v8 = v7;
  }

  return v7;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (NSArray)strings
{
  return self->_strings;
}

- (int64_t)focusedIndex
{
  return self->_focusedIndex;
}

- (BOOL)truncateStrings
{
  return self->_truncateStrings;
}

- (BOOL)alignAtTop
{
  return self->_alignAtTop;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strings, 0);

  objc_storeStrong((id *)&self->_imageData, 0);
}

@end