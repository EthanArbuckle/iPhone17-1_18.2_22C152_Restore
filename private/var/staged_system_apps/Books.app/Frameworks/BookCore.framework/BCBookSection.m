@interface BCBookSection
+ (BCBookSection)bookSectionWithStartPosition:(id)a3 endPosition:(id)a4;
- (BCBookPosition)endPosition;
- (BCBookPosition)startPosition;
- (BOOL)contains:(id)a3;
- (BOOL)intersects:(id)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (int64_t)compareWithSection:(id)a3;
- (void)setEndPosition:(id)a3;
- (void)setStartPosition:(id)a3;
@end

@implementation BCBookSection

+ (BCBookSection)bookSectionWithStartPosition:(id)a3 endPosition:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(BCBookSection);
  [(BCBookSection *)v7 setStartPosition:v6];

  [(BCBookSection *)v7 setEndPosition:v5];

  return v7;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  id v5 = [(BCBookSection *)self startPosition];
  id v6 = (char *)[v5 compare:v4];

  v7 = [(BCBookSection *)self endPosition];
  id v8 = [v7 compare:v4];

  if (v8 == (id)-1) {
    int64_t v9 = -1;
  }
  else {
    int64_t v9 = 0;
  }
  if (v6 == (unsigned char *)&def_7D91C + 1) {
    return 1;
  }
  else {
    return v9;
  }
}

- (int64_t)compareWithSection:(id)a3
{
  id v4 = a3;
  id v5 = [(BCBookSection *)self startPosition];
  id v6 = [v4 startPosition];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

- (BOOL)contains:(id)a3
{
  return a3 && -[BCBookSection compare:](self, "compare:") == 0;
}

- (BOOL)intersects:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  id v5 = [(BCBookSection *)self startPosition];
  id v6 = [v4 endPosition];
  id v7 = (char *)[v5 compare:v6];

  id v8 = [(BCBookSection *)self endPosition];
  int64_t v9 = [v4 startPosition];

  v10 = (char *)[v8 compare:v9];
  return v7 != (unsigned char *)&def_7D91C + 1 && v10 + 1 != 0;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"BCBookSection\n"];
  id v4 = [(BCBookSection *)self startPosition];
  [v3 appendFormat:@"        startPosition . . . . : %@\n", v4];

  id v5 = [(BCBookSection *)self endPosition];
  [v3 appendFormat:@"        endPosition . . . . . : %@", v5];

  return v3;
}

- (BCBookPosition)startPosition
{
  return self->_startPosition;
}

- (void)setStartPosition:(id)a3
{
}

- (BCBookPosition)endPosition
{
  return self->_endPosition;
}

- (void)setEndPosition:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endPosition, 0);

  objc_storeStrong((id *)&self->_startPosition, 0);
}

@end