@interface RKMessage
- (NSDate)dateSent;
- (NSString)title;
- (NSUUID)senderUUID;
- (RKMessage)initWithString:(id)a3 title:(id)a4 languageIdentifier:(id)a5 senderUUID:(id)a6 dateSent:(id)a7 position:(unint64_t)a8;
- (unint64_t)position;
- (void)annotateRange:(_NSRange)a3 type:(unint64_t)a4 field:(unint64_t)a5;
@end

@implementation RKMessage

- (RKMessage)initWithString:(id)a3 title:(id)a4 languageIdentifier:(id)a5 senderUUID:(id)a6 dateSent:(id)a7 position:(unint64_t)a8
{
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  v21.receiver = self;
  v21.super_class = (Class)RKMessage;
  v18 = [(RKText *)&v21 initWithString:a3 andLanguageIdentifier:a5];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_title, a4);
    objc_storeStrong((id *)&v19->_senderUUID, a6);
    objc_storeStrong((id *)&v19->_dateSent, a7);
    v19->_position = a8;
  }

  return v19;
}

- (void)annotateRange:(_NSRange)a3 type:(unint64_t)a4 field:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (a5 == 1) {
    [(RKMessage *)self title];
  }
  else {
  v9 = [(RKText *)self string];
  }
  NSUInteger v10 = [v9 length];

  v21.NSUInteger location = 0;
  v21.NSUInteger length = v10;
  v28.NSUInteger location = location;
  v28.NSUInteger length = length;
  if (!NSIntersectionRange(v21, v28).length)
  {
    id v15 = (void *)MEMORY[0x263EFF940];
    uint64_t v16 = *MEMORY[0x263EFF578];
    v24.NSUInteger location = location;
    v24.NSUInteger length = length;
    v14 = NSStringFromRange(v24);
    v25.NSUInteger location = 0;
    v25.NSUInteger length = v10;
    id v17 = NSStringFromRange(v25);
    [v15 raise:v16, @"Annotation range %@ does not intersect text range %@", v14, v17 format];
LABEL_11:

    goto LABEL_12;
  }
  v22.NSUInteger location = 0;
  v22.NSUInteger length = v10;
  v29.NSUInteger location = location;
  v29.NSUInteger length = length;
  NSRange v11 = NSUnionRange(v22, v29);
  if (v11.location || v11.length != v10)
  {
    v18 = (void *)MEMORY[0x263EFF940];
    uint64_t v19 = *MEMORY[0x263EFF578];
    v26.NSUInteger location = location;
    v26.NSUInteger length = length;
    v14 = NSStringFromRange(v26);
    v27.NSUInteger location = 0;
    v27.NSUInteger length = v10;
    id v17 = NSStringFromRange(v27);
    [v18 raise:v19, @"Annotation range %@ is not fully contained by text range %@", v14, v17 format];
    goto LABEL_11;
  }
  if (!length)
  {
    v12 = (void *)MEMORY[0x263EFF940];
    uint64_t v13 = *MEMORY[0x263EFF578];
    v23.NSUInteger location = location;
    v23.NSUInteger length = 0;
    v14 = NSStringFromRange(v23);
    [v12 raise:v13, @"Annotation range %@ is empty", v14 format];
LABEL_12:
  }
  v20.receiver = self;
  v20.super_class = (Class)RKMessage;
  -[RKText annotateRange:type:](&v20, sel_annotateRange_type_, location, length, a4);
}

- (NSString)title
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSUUID)senderUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSDate)dateSent
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (unint64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_senderUUID, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end