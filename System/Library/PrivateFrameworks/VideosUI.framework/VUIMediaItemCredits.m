@interface VUIMediaItemCredits
+ (id)_arrayFromStringRepresentation:(id)a3;
+ (id)_stringRepresentationFromArray:(id)a3;
- (BOOL)hasCredits;
- (BOOL)isEqual:(id)a3;
- (NSOrderedSet)cast;
- (NSOrderedSet)directors;
- (NSOrderedSet)producers;
- (NSOrderedSet)screenwriters;
- (VUIMediaItemCredits)initWithStringRepresentation:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)stringRepresentation;
- (unint64_t)hash;
- (void)setCast:(id)a3;
- (void)setDirectors:(id)a3;
- (void)setProducers:(id)a3;
- (void)setScreenwriters:(id)a3;
@end

@implementation VUIMediaItemCredits

- (NSOrderedSet)cast
{
  cast = self->_cast;
  if (!cast)
  {
    v4 = [MEMORY[0x1E4F1CAA0] orderedSet];
    v5 = self->_cast;
    self->_cast = v4;

    cast = self->_cast;
  }
  return cast;
}

- (NSOrderedSet)directors
{
  directors = self->_directors;
  if (!directors)
  {
    v4 = [MEMORY[0x1E4F1CAA0] orderedSet];
    v5 = self->_directors;
    self->_directors = v4;

    directors = self->_directors;
  }
  return directors;
}

- (NSOrderedSet)producers
{
  producers = self->_producers;
  if (!producers)
  {
    v4 = [MEMORY[0x1E4F1CAA0] orderedSet];
    v5 = self->_producers;
    self->_producers = v4;

    producers = self->_producers;
  }
  return producers;
}

- (NSOrderedSet)screenwriters
{
  screenwriters = self->_screenwriters;
  if (!screenwriters)
  {
    v4 = [MEMORY[0x1E4F1CAA0] orderedSet];
    v5 = self->_screenwriters;
    self->_screenwriters = v4;

    screenwriters = self->_screenwriters;
  }
  return screenwriters;
}

- (BOOL)hasCredits
{
  v3 = [(VUIMediaItemCredits *)self cast];
  uint64_t v4 = [v3 count];
  v5 = [(VUIMediaItemCredits *)self directors];
  uint64_t v6 = [v5 count] + v4;
  v7 = [(VUIMediaItemCredits *)self producers];
  uint64_t v8 = v6 + [v7 count];
  v9 = [(VUIMediaItemCredits *)self screenwriters];
  uint64_t v10 = [v9 count];

  return v8 + v10 != 0;
}

- (VUIMediaItemCredits)initWithStringRepresentation:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28B88];
  id v5 = a3;
  uint64_t v6 = [v4 characterSetWithCharactersInString:@","];
  v7 = [v5 componentsSeparatedByCharactersInSet:v6];

  if ([v7 count] != 4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The string representation must contain exactly four components"];
  }
  uint64_t v8 = [v7 objectAtIndex:0];
  v9 = [(id)objc_opt_class() _arrayFromStringRepresentation:v8];
  uint64_t v10 = [v7 objectAtIndex:1];

  v11 = [(id)objc_opt_class() _arrayFromStringRepresentation:v10];
  v12 = [v7 objectAtIndex:2];

  v13 = [(id)objc_opt_class() _arrayFromStringRepresentation:v12];
  v14 = [v7 objectAtIndex:3];

  v15 = [(id)objc_opt_class() _arrayFromStringRepresentation:v14];
  v16 = [(VUIMediaItemCredits *)self init];
  if (v16)
  {
    uint64_t v17 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v9];
    cast = v16->_cast;
    v16->_cast = (NSOrderedSet *)v17;

    uint64_t v19 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v11];
    directors = v16->_directors;
    v16->_directors = (NSOrderedSet *)v19;

    uint64_t v21 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v13];
    producers = v16->_producers;
    v16->_producers = (NSOrderedSet *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v15];
    screenwriters = v16->_screenwriters;
    v16->_screenwriters = (NSOrderedSet *)v23;
  }
  return v16;
}

- (id)stringRepresentation
{
  v3 = objc_opt_class();
  uint64_t v4 = [(VUIMediaItemCredits *)self cast];
  id v5 = [v4 array];
  uint64_t v6 = [v3 _stringRepresentationFromArray:v5];

  v7 = objc_opt_class();
  uint64_t v8 = [(VUIMediaItemCredits *)self directors];
  v9 = [v8 array];
  uint64_t v10 = [v7 _stringRepresentationFromArray:v9];

  v11 = objc_opt_class();
  v12 = [(VUIMediaItemCredits *)self producers];
  v13 = [v12 array];
  v14 = [v11 _stringRepresentationFromArray:v13];

  v15 = objc_opt_class();
  v16 = [(VUIMediaItemCredits *)self screenwriters];
  uint64_t v17 = [v16 array];
  v18 = [v15 _stringRepresentationFromArray:v17];

  uint64_t v19 = [NSString stringWithFormat:@"%@,%@,%@,%@", v6, v10, v14, v18];

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_alloc_init(VUIMediaItemCredits);
  uint64_t v5 = [(NSOrderedSet *)self->_cast copy];
  cast = v4->_cast;
  v4->_cast = (NSOrderedSet *)v5;

  uint64_t v7 = [(NSOrderedSet *)self->_directors copy];
  directors = v4->_directors;
  v4->_directors = (NSOrderedSet *)v7;

  uint64_t v9 = [(NSOrderedSet *)self->_producers copy];
  producers = v4->_producers;
  v4->_producers = (NSOrderedSet *)v9;

  uint64_t v11 = [(NSOrderedSet *)self->_screenwriters copy];
  screenwriters = v4->_screenwriters;
  v4->_screenwriters = (NSOrderedSet *)v11;

  return v4;
}

- (unint64_t)hash
{
  v3 = [(VUIMediaItemCredits *)self cast];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [(VUIMediaItemCredits *)self directors];
  uint64_t v6 = [v5 hash] ^ v4;

  uint64_t v7 = [(VUIMediaItemCredits *)self producers];
  uint64_t v8 = [v7 hash];

  uint64_t v9 = [(VUIMediaItemCredits *)self screenwriters];
  unint64_t v10 = v6 ^ v8 ^ [v9 hash];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIMediaItemCredits *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        uint64_t v7 = [(VUIMediaItemCredits *)self cast];
        uint64_t v8 = [(VUIMediaItemCredits *)v6 cast];
        id v9 = v7;
        id v10 = v8;
        if (v9 == v10)
        {
        }
        else
        {
          uint64_t v11 = v10;
          char v12 = 0;
          if (!v9 || !v10) {
            goto LABEL_29;
          }
          char v13 = [v9 isEqual:v10];

          if ((v13 & 1) == 0) {
            goto LABEL_22;
          }
        }
        v14 = [(VUIMediaItemCredits *)self directors];
        v15 = [(VUIMediaItemCredits *)v6 directors];
        id v9 = v14;
        id v16 = v15;
        if (v9 == v16)
        {
        }
        else
        {
          uint64_t v11 = v16;
          char v12 = 0;
          if (!v9 || !v16) {
            goto LABEL_29;
          }
          char v17 = [v9 isEqual:v16];

          if ((v17 & 1) == 0) {
            goto LABEL_22;
          }
        }
        v18 = [(VUIMediaItemCredits *)self producers];
        uint64_t v19 = [(VUIMediaItemCredits *)v6 producers];
        id v9 = v18;
        id v20 = v19;
        if (v9 == v20)
        {

LABEL_24:
          v22 = [(VUIMediaItemCredits *)self screenwriters];
          uint64_t v23 = [(VUIMediaItemCredits *)v6 screenwriters];
          id v9 = v22;
          id v24 = v23;
          uint64_t v11 = v24;
          if (v9 == v24)
          {
            char v12 = 1;
          }
          else
          {
            char v12 = 0;
            if (v9 && v24) {
              char v12 = [v9 isEqual:v24];
            }
          }
          goto LABEL_29;
        }
        uint64_t v11 = v20;
        char v12 = 0;
        if (v9 && v20)
        {
          char v21 = [v9 isEqual:v20];

          if ((v21 & 1) == 0)
          {
LABEL_22:
            char v12 = 0;
LABEL_30:

            goto LABEL_31;
          }
          goto LABEL_24;
        }
LABEL_29:

        goto LABEL_30;
      }
    }
    char v12 = 0;
  }
LABEL_31:

  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v21.receiver = self;
  v21.super_class = (Class)VUIMediaItemCredits;
  uint64_t v4 = [(VUIMediaItemCredits *)&v21 description];
  [v3 addObject:v4];

  uint64_t v5 = NSString;
  uint64_t v6 = [(VUIMediaItemCredits *)self cast];
  uint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"cast", v6];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  id v9 = [(VUIMediaItemCredits *)self directors];
  id v10 = [v8 stringWithFormat:@"%@=%@", @"directors", v9];
  [v3 addObject:v10];

  uint64_t v11 = NSString;
  char v12 = [(VUIMediaItemCredits *)self producers];
  char v13 = [v11 stringWithFormat:@"%@=%@", @"producers", v12];
  [v3 addObject:v13];

  v14 = NSString;
  v15 = [(VUIMediaItemCredits *)self screenwriters];
  id v16 = [v14 stringWithFormat:@"%@=%@", @"screenwriters", v15];
  [v3 addObject:v16];

  char v17 = NSString;
  v18 = [v3 componentsJoinedByString:@", "];
  uint64_t v19 = [v17 stringWithFormat:@"<%@>", v18];

  return v19;
}

+ (id)_arrayFromStringRepresentation:(id)a3
{
  return (id)[a3 componentsSeparatedByString:@"|"];
}

+ (id)_stringRepresentationFromArray:(id)a3
{
  return (id)[a3 componentsJoinedByString:@"|"];
}

- (void)setCast:(id)a3
{
}

- (void)setDirectors:(id)a3
{
}

- (void)setProducers:(id)a3
{
}

- (void)setScreenwriters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenwriters, 0);
  objc_storeStrong((id *)&self->_producers, 0);
  objc_storeStrong((id *)&self->_directors, 0);
  objc_storeStrong((id *)&self->_cast, 0);
}

@end