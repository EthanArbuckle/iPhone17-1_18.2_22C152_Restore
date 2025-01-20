@interface MNButtonActionTitle
+ (BOOL)supportsSecureCoding;
- (GEOComposedString)formattedTitle;
- (MNButtonActionTitle)initWithAction:(unint64_t)a3 withTitle:(id)a4 buttonDisplay:(int)a5;
- (MNButtonActionTitle)initWithCoder:(id)a3;
- (NSString)title;
- (int)buttonDisplay;
- (unint64_t)action;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MNButtonActionTitle

- (MNButtonActionTitle)initWithAction:(unint64_t)a3 withTitle:(id)a4 buttonDisplay:(int)a5
{
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)MNButtonActionTitle;
  v9 = [(MNButtonActionTitle *)&v18 init];
  v10 = v9;
  if (v9)
  {
    v9->_action = a3;
    v11 = [v8 formatStrings];
    uint64_t v12 = [v11 firstObject];
    title = v10->_title;
    v10->_title = (NSString *)v12;

    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F644D0]) initWithGeoFormattedString:v8];
    formattedTitle = v10->_formattedTitle;
    v10->_formattedTitle = (GEOComposedString *)v14;

    v10->_buttonDisplay = a5;
    v16 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNButtonActionTitle)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNButtonActionTitle;
  v5 = [(MNButtonActionTitle *)&v10 init];
  if (v5)
  {
    v5->_action = [v4 decodeIntegerForKey:@"_action"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_buttonDisplay = [v4 decodeIntegerForKey:@"_buttonDisplay"];
    id v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t action = self->_action;
  id v5 = a3;
  [v5 encodeInteger:action forKey:@"_action"];
  [v5 encodeObject:self->_title forKey:@"_title"];
  [v5 encodeInteger:self->_buttonDisplay forKey:@"_buttonDisplay"];
}

- (unint64_t)action
{
  return self->_action;
}

- (GEOComposedString)formattedTitle
{
  return self->_formattedTitle;
}

- (NSString)title
{
  return self->_title;
}

- (int)buttonDisplay
{
  return self->_buttonDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_formattedTitle, 0);
}

@end