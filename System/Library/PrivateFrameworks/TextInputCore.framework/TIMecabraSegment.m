@interface TIMecabraSegment
+ (void)splitSegments:(id)a3 at:(int)a4 forPrefix:(id *)a5 forSuffix:(id *)a6;
- (NSString)reading;
- (NSString)surface;
- (void)setReading:(id)a3;
- (void)setSurface:(id)a3;
@end

@implementation TIMecabraSegment

+ (void)splitSegments:(id)a3 at:(int)a4 forPrefix:(id *)a5 forSuffix:(id *)a6
{
  id v18 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v10 = [v18 count];
  if (v10 < 1)
  {
    id v13 = 0;
    if (a5) {
LABEL_10:
    }
      *a5 = v13;
  }
  else
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    id v13 = 0;
    uint64_t v14 = v10 - a4;
    do
    {
      if (v12 >= v14)
      {
        v15 = [v18 objectAtIndexedSubscript:v12];
        v16 = [v15 reading];
        v17 = v9;
      }
      else
      {
        if (!v13) {
          id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        }
        v15 = [v18 objectAtIndexedSubscript:v12];
        v16 = [v15 surface];
        v17 = v13;
      }
      [v17 appendString:v16];

      ++v12;
    }
    while (v11 != v12);
    if (a5) {
      goto LABEL_10;
    }
  }
  if (a6) {
    *a6 = v9;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_surface, 0);

  objc_storeStrong((id *)&self->_reading, 0);
}

- (void)setSurface:(id)a3
{
}

- (NSString)surface
{
  return self->_surface;
}

- (void)setReading:(id)a3
{
}

- (NSString)reading
{
  return self->_reading;
}

@end