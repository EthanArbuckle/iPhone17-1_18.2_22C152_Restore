@interface PPCalendar
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCalendar:(id)a3;
- (CGColor)color;
- (NSString)calendarIdentifier;
- (NSString)title;
- (PPCalendar)initWithCalendarIdentifier:(id)a3 title:(id)a4 color:(CGColor *)a5;
- (PPCalendar)initWithCoder:(id)a3;
- (PPCalendar)initWithEKCalendar:(id)a3 internPool:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPCalendar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
}

- (CGColor)color
{
  return self->_color;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (BOOL)isEqualToCalendar:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  calendarIdentifier = self->_calendarIdentifier;
  v7 = (NSString *)v4[1];
  if (calendarIdentifier == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = calendarIdentifier;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_8;
    }
  }
  title = self->_title;
  v12 = (NSString *)v5[2];
  if (title == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = title;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0)
    {
LABEL_8:
      BOOL v16 = 0;
      goto LABEL_13;
    }
  }
  color = self->_color;
  v18 = (CGColor *)v5[3];
  BOOL v16 = color == v18 || CGColorEqualToColor(color, v18);
LABEL_13:

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPCalendar *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPCalendar *)self isEqualToCalendar:v5];

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_calendarIdentifier hash];
  return [(NSString *)self->_title hash] - v3 + 32 * v3;
}

- (void)encodeWithCoder:(id)a3
{
  calendarIdentifier = self->_calendarIdentifier;
  id v5 = a3;
  [v5 encodeObject:calendarIdentifier forKey:@"cid"];
  [v5 encodeObject:self->_title forKey:@"ttl"];
  PPEncodeCalendarColor(v5, self->_color);
}

- (PPCalendar)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  BOOL v6 = [v4 decodeObjectOfClass:v5 forKey:@"cid"];
  uint64_t v7 = [v4 decodeObjectOfClass:v5 forKey:@"ttl"];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    v11 = 0;
  }
  else
  {
    char v10 = PPCreateCalendarColorWithDecoder(v4);
    self = [(PPCalendar *)self initWithCalendarIdentifier:v6 title:v8 color:v10];
    CGColorRelease(v10);
    v11 = self;
  }

  return v11;
}

- (id)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"<PPCalendar i:'%@' t:'%@'>", self->_calendarIdentifier, self->_title];
  return v2;
}

- (void)dealloc
{
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)PPCalendar;
  [(PPCalendar *)&v3 dealloc];
}

- (PPCalendar)initWithCalendarIdentifier:(id)a3 title:(id)a4 color:(CGColor *)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPCalendar;
  char v10 = [(PPCalendar *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    calendarIdentifier = v10->_calendarIdentifier;
    v10->_calendarIdentifier = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    title = v10->_title;
    v10->_title = (NSString *)v13;

    CGColorRetain(a5);
    v10->_color = a5;
  }

  return v10;
}

- (PPCalendar)initWithEKCalendar:(id)a3 internPool:(id)a4
{
  uint64_t v5 = [a4 internedCalendarWithEKCalendar:a3];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end