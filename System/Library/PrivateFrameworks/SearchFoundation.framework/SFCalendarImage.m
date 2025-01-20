@interface SFCalendarImage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDate)date;
- (NSDictionary)dictionaryRepresentation;
- (SFCalendarImage)initWithCoder:(id)a3;
- (SFCalendarImage)initWithDate:(id)a3;
- (SFCalendarImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation SFCalendarImage

- (SFCalendarImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SFCalendarImage;
  v5 = [(SFCalendarImage *)&v12 init];
  if (v5)
  {
    v6 = [v4 date];

    if (v6)
    {
      v7 = [v4 date];
      v8 = (void *)MEMORY[0x1E4F1C9C8];
      [v7 secondsSince1970];
      v9 = objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
      [(SFCalendarImage *)v5 setDate:v9];
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setDate:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)SFCalendarImage;
  unint64_t v3 = [(SFImage *)&v7 hash];
  id v4 = [(SFCalendarImage *)self date];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFCalendarImage *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else if ([(SFCalendarImage *)v4 isMemberOfClass:objc_opt_class()] {
         && (v13.receiver = self,
  }
             v13.super_class = (Class)SFCalendarImage,
             [(SFImage *)&v13 isEqual:v4]))
  {
    unint64_t v5 = v4;
    v6 = [(SFCalendarImage *)self date];
    objc_super v7 = [(SFCalendarImage *)v5 date];
    if ((v6 == 0) == (v7 != 0))
    {
      char v11 = 0;
    }
    else
    {
      v8 = [(SFCalendarImage *)self date];
      if (v8)
      {
        v9 = [(SFCalendarImage *)self date];
        v10 = [(SFCalendarImage *)v5 date];
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
  v8.super_class = (Class)SFCalendarImage;
  id v4 = [(SFImage *)&v8 copyWithZone:a3];
  unint64_t v5 = [(SFCalendarImage *)self date];
  v6 = (void *)[v5 copy];
  [v4 setDate:v6];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBCalendarImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCalendarImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBCalendarImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBCalendarImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBImage alloc] initWithFacade:self];
  unint64_t v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFCalendarImage)initWithCoder:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFCalendarImage;
  objc_super v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFCalendarImage)initWithDate:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(SFCalendarImage *)self init];
  v6 = v5;
  if (v5) {
    [(SFCalendarImage *)v5 setDate:v4];
  }

  return v6;
}

@end