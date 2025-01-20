@interface TCOfficeFontInfo
+ (id)officeFontInfoWithFullName:(id)a3 isBold:(BOOL)a4 isItalic:(BOOL)a5;
- (BOOL)isBold;
- (BOOL)isItalic;
- (NSString)fullName;
- (TCOfficeFontInfo)initWithFullName:(id)a3 isBold:(BOOL)a4 isItalic:(BOOL)a5;
- (id)description;
- (id)officeName;
@end

@implementation TCOfficeFontInfo

- (TCOfficeFontInfo)initWithFullName:(id)a3 isBold:(BOOL)a4 isItalic:(BOOL)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TCOfficeFontInfo;
  v9 = [(TCOfficeFontInfo *)&v13 init];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    fullName = v9->_fullName;
    v9->_fullName = (NSString *)v10;

    v9->_isBold = a4;
    v9->_isItalic = a5;
  }

  return v9;
}

+ (id)officeFontInfoWithFullName:(id)a3 isBold:(BOOL)a4 isItalic:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  v9 = (void *)[objc_alloc((Class)a1) initWithFullName:v8 isBold:v6 isItalic:v5];

  return v9;
}

- (id)officeName
{
  NSUInteger v3 = [(NSString *)self->_fullName length];
  fullName = self->_fullName;
  if (v3 > 0x1F)
  {
    BOOL v5 = [(NSString *)fullName substringToIndex:31];
  }
  else
  {
    BOOL v5 = fullName;
  }
  return v5;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v4 = [(TCOfficeFontInfo *)self fullName];
  BOOL v5 = [v3 stringWithFormat:@"office_font={\"%@\" B:%d I:%d}", v4, -[TCOfficeFontInfo isBold](self, "isBold"), -[TCOfficeFontInfo isItalic](self, "isItalic")];

  return v5;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (BOOL)isBold
{
  return self->_isBold;
}

- (BOOL)isItalic
{
  return self->_isItalic;
}

- (void).cxx_destruct
{
}

@end