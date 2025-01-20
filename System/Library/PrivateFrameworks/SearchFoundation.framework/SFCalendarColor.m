@interface SFCalendarColor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)eventIdentifier;
- (SFCalendarColor)initWithCoder:(id)a3;
- (SFCalendarColor)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setEventIdentifier:(id)a3;
@end

@implementation SFCalendarColor

- (void).cxx_destruct
{
}

- (void)setEventIdentifier:(id)a3
{
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFCalendarColor;
  unint64_t v3 = [(SFColor *)&v7 hash];
  v4 = [(SFCalendarColor *)self eventIdentifier];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SFCalendarColor *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFCalendarColor *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFCalendarColor,
             [(SFColor *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFCalendarColor *)self eventIdentifier];
    objc_super v7 = [(SFCalendarColor *)v5 eventIdentifier];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFCalendarColor *)self eventIdentifier];
      if (v8)
      {
        v9 = [(SFCalendarColor *)self eventIdentifier];
        v10 = [(SFCalendarColor *)v5 eventIdentifier];
        char v11 = [v9 isEqual:v10];
      }
      else
      {
        char v11 = 1;
      }
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SFCalendarColor;
  id v4 = [(SFColor *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFCalendarColor *)self eventIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setEventIdentifier:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCalendarColor alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCalendarColor *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCalendarColor alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCalendarColor *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SFCalendarColor;
  [(SFColor *)&v3 encodeWithCoder:a3];
}

- (SFCalendarColor)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFCalendarColor *)self init];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  objc_super v7 = [[_SFPBColor alloc] initWithData:v6];
  objc_super v8 = [[SFColor alloc] initWithProtobuf:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v9 = [(SFColor *)v8 eventIdentifier];
    [(SFCalendarColor *)v5 setEventIdentifier:v9];

    [(SFColor *)v8 redComponent];
    -[SFColor setRedComponent:](v5, "setRedComponent:");
    [(SFColor *)v8 greenComponent];
    -[SFColor setGreenComponent:](v5, "setGreenComponent:");
    [(SFColor *)v8 blueComponent];
    -[SFColor setBlueComponent:](v5, "setBlueComponent:");
    [(SFColor *)v8 alphaComponent];
    -[SFColor setAlphaComponent:](v5, "setAlphaComponent:");
    [(SFColor *)v5 setColorTintStyle:[(SFColor *)v8 colorTintStyle]];
    v10 = [(SFColor *)v8 darkModeColor];
    [(SFColor *)v5 setDarkModeColor:v10];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCalendarColor)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFCalendarColor;
  unint64_t v5 = [(SFCalendarColor *)&v10 init];
  if (v5)
  {
    v6 = [v4 eventIdentifier];

    if (v6)
    {
      objc_super v7 = [v4 eventIdentifier];
      [(SFCalendarColor *)v5 setEventIdentifier:v7];
    }
    objc_super v8 = v5;
  }

  return v5;
}

@end