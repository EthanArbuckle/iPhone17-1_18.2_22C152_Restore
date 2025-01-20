@interface PVTimedObject
+ (BOOL)supportsSecureCoding;
+ (id)findTimedObjectInSortedArray:(id)a3 atTime:(id *)a4 returnFirstObjectForTimeBeforeFirst:(BOOL)a5 returnLastObjectForTimeAfterLast:(BOOL)a6;
+ (id)timedObjectWithTime:(id *)a3;
+ (id)timedObjectWithTime:(id *)a3 object:(id)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time;
- (BOOL)isEqual:(id)a3;
- (NSSecureCoding)object;
- (PVTimedObject)init;
- (PVTimedObject)initWithCoder:(id)a3;
- (PVTimedObject)initWithObject:(id)a3;
- (PVTimedObject)initWithTime:(id *)a3;
- (PVTimedObject)initWithTime:(id *)a3 object:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setObject:(id)a3;
- (void)setTime:(id *)a3;
@end

@implementation PVTimedObject

+ (id)timedObjectWithTime:(id *)a3
{
  id v4 = objc_alloc((Class)a1);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a3;
  v5 = (void *)[v4 initWithTime:&v7];

  return v5;
}

+ (id)timedObjectWithTime:(id *)a3 object:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc((Class)a1);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10 = *a3;
  v8 = (void *)[v7 initWithTime:&v10 object:v6];

  return v8;
}

- (PVTimedObject)init
{
  long long v3 = *MEMORY[0x1E4F1FA48];
  uint64_t v4 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  return [(PVTimedObject *)self initWithTime:&v3];
}

- (PVTimedObject)initWithTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v4 = *a3;
  return [(PVTimedObject *)self initWithTime:&v4 object:0];
}

- (PVTimedObject)initWithObject:(id)a3
{
  long long v4 = *MEMORY[0x1E4F1FA48];
  uint64_t v5 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  return [(PVTimedObject *)self initWithTime:&v4 object:a3];
}

- (PVTimedObject)initWithTime:(id *)a3 object:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PVTimedObject;
  id v7 = [(PVTimedObject *)&v12 init];
  v8 = v7;
  if (v7)
  {
    long long v10 = *(_OWORD *)&a3->var0;
    int64_t var3 = a3->var3;
    [(PVTimedObject *)v7 setTime:&v10];
    [(PVTimedObject *)v8 setObject:v6];
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PVTimedObject)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (PVTimedObject *)objc_alloc_init((Class)objc_opt_class());

  if (v5 && [v4 decodeIntForKey:@"PVTimedObject_CodingVersion"] == 1)
  {
    if (v4)
    {
      [v4 decodeCMTimeForKey:@"PVTimedObject_Time"];
    }
    else
    {
      long long v14 = 0uLL;
      uint64_t v15 = 0;
    }
    long long v12 = v14;
    uint64_t v13 = v15;
    [(PVTimedObject *)v5 setTime:&v12];
    id v6 = [v4 allowedClasses];
    uint64_t v11 = 0;
    id v7 = [v4 decodeTopLevelObjectOfClasses:v6 forKey:@"PVTimedObject_Object" error:&v11];
    uint64_t v8 = v11;
    [(PVTimedObject *)v5 setObject:v7];

    if (v8) {
      id v9 = (id)[v4 decodeObjectOfClass:objc_opt_class() forKey:@"PVTimedObject_Object"];
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInt:1 forKey:@"PVTimedObject_CodingVersion"];
  [(PVTimedObject *)self time];
  [v4 encodeCMTime:v10 forKey:@"PVTimedObject_Time"];
  uint64_t v5 = [(PVTimedObject *)self object];

  if (v5)
  {
    id v6 = [(PVTimedObject *)self object];
    id v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    [v4 encodeObject:v8 forKey:@"PVTimedObject_ObjectClass"];

    id v9 = [(PVTimedObject *)self object];
    [v4 encodeObject:v9 forKey:@"PVTimedObject_Object"];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  [(PVTimedObject *)self time];
  id v4 = [(PVTimedObject *)self object];
  uint64_t v5 = (void *)[v4 copy];
  id v6 = +[PVTimedObject timedObjectWithTime:v8 object:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PVTimedObject *)a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_6;
  }
  if (self == v4)
  {
    char v7 = 1;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    [(PVTimedObject *)self time];
    [(PVTimedObject *)v6 time];
    if (CMTimeCompare(&time1, &v11))
    {
      char v7 = 0;
    }
    else
    {
      uint64_t v8 = [(PVTimedObject *)self object];
      id v9 = [(PVTimedObject *)v6 object];
      char v7 = [v8 isEqual:v9];
    }
  }
  else
  {
LABEL_6:
    char v7 = 0;
  }
LABEL_10:

  return v7;
}

- (unint64_t)hash
{
  long long v3 = [(PVTimedObject *)self object];
  uint64_t v4 = [v3 hash];

  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  [(PVTimedObject *)self time];
  return v6 ^ v4 ^ (int)v7 ^ (unint64_t)HIDWORD(v7) ^ v8;
}

- (id)description
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  [(PVTimedObject *)self time];
  uint64_t v4 = (__CFString *)CMTimeCopyDescription(v3, &time);
  uint64_t v5 = NSString;
  v12.receiver = self;
  v12.super_class = (Class)PVTimedObject;
  uint64_t v6 = [(PVTimedObject *)&v12 description];
  uint64_t v7 = [(PVTimedObject *)self object];
  uint64_t v8 = [v7 description];
  id v9 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
  long long v10 = [v5 stringWithFormat:@"%@\n\ttime:   %@\n\tobject: %@", v6, v4, v9];

  return v10;
}

+ (id)findTimedObjectInSortedArray:(id)a3 atTime:(id *)a4 returnFirstObjectForTimeBeforeFirst:(BOOL)a5 returnLastObjectForTimeAfterLast:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  CFArrayRef v9 = (const __CFArray *)a3;
  CFArrayRef v10 = v9;
  if (!v9 || (uint64_t v11 = [(__CFArray *)v9 count]) == 0)
  {
    id v18 = 0;
    goto LABEL_18;
  }
  CFIndex v12 = v11;
  CMTime time2 = (CMTime)*a4;
  uint64_t v13 = +[PVTimedObject timedObjectWithTime:&time2];
  v24.location = 0;
  v24.length = v12;
  CFIndex v14 = CFArrayBSearchValues(v10, v24, v13, (CFComparatorFunction)compareTimedObjects, 0);
  if (v14 < v12)
  {
    CFIndex v15 = v14;
    if ((v14 & 0x8000000000000000) == 0)
    {
      v16 = [(__CFArray *)v10 objectAtIndexedSubscript:v14];
      v17 = v16;
      if (v16) {
        [v16 time];
      }
      else {
        memset(&time1, 0, sizeof(time1));
      }
      CMTime time2 = (CMTime)*a4;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        if (!v15)
        {
          if (v7)
          {
            id v18 = [(__CFArray *)v10 firstObject];
          }
          else
          {
            id v18 = 0;
          }
          goto LABEL_16;
        }
        uint64_t v19 = [(__CFArray *)v10 objectAtIndexedSubscript:v15 - 1];

        v17 = (void *)v19;
      }
      id v18 = v17;
      v17 = v18;
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_10;
  }
  if (!v6)
  {
LABEL_10:
    id v18 = 0;
    goto LABEL_17;
  }
  id v18 = [(__CFArray *)v10 lastObject];
LABEL_17:

LABEL_18:

  return v18;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)time
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (void)setTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_time.epoch = a3->var3;
  *(_OWORD *)&self->_time.value = v3;
}

- (NSSecureCoding)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
}

- (void).cxx_destruct
{
}

@end