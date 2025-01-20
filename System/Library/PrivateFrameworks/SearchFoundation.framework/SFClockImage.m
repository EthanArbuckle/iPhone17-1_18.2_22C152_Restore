@interface SFClockImage
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSNumber)hour;
- (NSNumber)minute;
- (NSNumber)second;
- (SFClockImage)initWithCoder:(id)a3;
- (SFClockImage)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setHour:(id)a3;
- (void)setMinute:(id)a3;
- (void)setSecond:(id)a3;
@end

@implementation SFClockImage

- (SFClockImage)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFClockImage;
  v5 = [(SFClockImage *)&v11 init];
  if (v5)
  {
    if ([v4 hour])
    {
      v6 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "hour"));
      [(SFClockImage *)v5 setHour:v6];
    }
    if ([v4 minute])
    {
      v7 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "minute"));
      [(SFClockImage *)v5 setMinute:v7];
    }
    if ([v4 second])
    {
      v8 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v4, "second"));
      [(SFClockImage *)v5 setSecond:v8];
    }
    v9 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_second, 0);
  objc_storeStrong((id *)&self->_minute, 0);
  objc_storeStrong((id *)&self->_hour, 0);
}

- (void)setSecond:(id)a3
{
}

- (NSNumber)second
{
  return self->_second;
}

- (void)setMinute:(id)a3
{
}

- (NSNumber)minute
{
  return self->_minute;
}

- (void)setHour:(id)a3
{
}

- (NSNumber)hour
{
  return self->_hour;
}

- (unint64_t)hash
{
  v11.receiver = self;
  v11.super_class = (Class)SFClockImage;
  unint64_t v3 = [(SFImage *)&v11 hash];
  id v4 = [(SFClockImage *)self hour];
  uint64_t v5 = [v4 hash];
  v6 = [(SFClockImage *)self minute];
  uint64_t v7 = v5 ^ [v6 hash];
  v8 = [(SFClockImage *)self second];
  unint64_t v9 = v7 ^ [v8 hash] ^ v3;

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (SFClockImage *)a3;
  if (self == v5)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFClockImage *)v5 isMemberOfClass:objc_opt_class()])
    {
      v32.receiver = self;
      v32.super_class = (Class)SFClockImage;
      if ([(SFImage *)&v32 isEqual:v5])
      {
        v6 = v5;
        uint64_t v7 = [(SFClockImage *)self hour];
        v8 = [(SFClockImage *)v6 hour];
        if ((v7 == 0) == (v8 != 0))
        {
          char v11 = 0;
LABEL_31:

          goto LABEL_32;
        }
        unint64_t v9 = [(SFClockImage *)self hour];
        if (v9)
        {
          unint64_t v3 = [(SFClockImage *)self hour];
          v10 = [(SFClockImage *)v6 hour];
          if (![v3 isEqual:v10])
          {
            char v11 = 0;
            goto LABEL_29;
          }
          v31 = v10;
        }
        v12 = [(SFClockImage *)self minute];
        v13 = [(SFClockImage *)v6 minute];
        v14 = v13;
        if ((v12 == 0) == (v13 != 0))
        {

          char v11 = 0;
          goto LABEL_28;
        }
        v15 = [(SFClockImage *)self minute];
        if (v15)
        {
          v25 = v12;
          v16 = [(SFClockImage *)self minute];
          v27 = [(SFClockImage *)v6 minute];
          v28 = v16;
          if (!objc_msgSend(v16, "isEqual:"))
          {
            char v11 = 0;
            v12 = v25;
            goto LABEL_26;
          }
          v29 = v15;
          v30 = v3;
          v12 = v25;
        }
        else
        {
          v29 = 0;
          v30 = v3;
        }
        v17 = [(SFClockImage *)self second];
        v18 = [(SFClockImage *)v6 second];
        if ((v17 == 0) == (v18 != 0))
        {

          char v11 = 0;
          v15 = v29;
          unint64_t v3 = v30;
          if (!v29) {
            goto LABEL_27;
          }
        }
        else
        {
          v24 = v17;
          v26 = v18;
          uint64_t v19 = [(SFClockImage *)self second];
          v15 = v29;
          if (v19)
          {
            v23 = (void *)v19;
            v22 = [(SFClockImage *)self second];
            v20 = [(SFClockImage *)v6 second];
            char v11 = objc_msgSend(v22, "isEqual:");
          }
          else
          {

            char v11 = 1;
          }
          unint64_t v3 = v30;
          if (!v29) {
            goto LABEL_27;
          }
        }
LABEL_26:

LABEL_27:
LABEL_28:
        v10 = v31;
        if (!v9)
        {
LABEL_30:

          goto LABEL_31;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    char v11 = 0;
  }
LABEL_32:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v12.receiver = self;
  v12.super_class = (Class)SFClockImage;
  id v4 = [(SFImage *)&v12 copyWithZone:a3];
  uint64_t v5 = [(SFClockImage *)self hour];
  v6 = (void *)[v5 copy];
  [v4 setHour:v6];

  uint64_t v7 = [(SFClockImage *)self minute];
  v8 = (void *)[v7 copy];
  [v4 setMinute:v8];

  unint64_t v9 = [(SFClockImage *)self second];
  v10 = (void *)[v9 copy];
  [v4 setSecond:v10];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBClockImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBClockImage *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBClockImage alloc] initWithFacade:self];
  unint64_t v3 = [(_SFPBClockImage *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBImage alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBImage *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFClockImage)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBImage alloc] initWithData:v5];
  v9.receiver = self;
  v9.super_class = (Class)SFClockImage;
  uint64_t v7 = [(SFImage *)&v9 initWithProtobuf:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end