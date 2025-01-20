@interface TISCTextRunResponse
+ (id)textRunResponseByMergingResponses:(id)a3;
+ (id)textRunResponseWithFont:(__CTFont *)a3;
- (__CFArray)ctLines;
- (__CTFont)font;
- (id)widths;
- (void)dealloc;
@end

@implementation TISCTextRunResponse

- (void).cxx_destruct
{
}

- (void)dealloc
{
  CFRelease(self->_ctLines);
  CFRelease(self->_font);
  v3.receiver = self;
  v3.super_class = (Class)TISCTextRunResponse;
  [(TISCTextRunResponse *)&v3 dealloc];
}

- (__CTFont)font
{
  return self->_font;
}

- (id)widths
{
  return self->_widths;
}

- (__CFArray)ctLines
{
  return self->_ctLines;
}

+ (id)textRunResponseByMergingResponses:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count] == 1)
  {
    v4 = [v3 objectAtIndexedSubscript:0];
  }
  else
  {
    v5 = [v3 firstObject];
    CFIndex Count = CFArrayGetCount((CFArrayRef)[v5 ctLines]);

    theArray = CFArrayCreateMutable(0, Count, MEMORY[0x1E4F1D510]);
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:Count];
    if (Count)
    {
      for (CFIndex i = 0; i != Count; ++i)
      {
        Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E4F1D510]);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v10 = v3;
        id v11 = v3;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v25;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v25 != v14) {
                objc_enumerationMutation(v11);
              }
              ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex((CFArrayRef)[*(id *)(*((void *)&v24 + 1) + 8 * j) ctLines], i);
              CFArrayRef GlyphRuns = CTLineGetGlyphRuns(ValueAtIndex);
              v31.length = CFArrayGetCount(GlyphRuns);
              v31.location = 0;
              CFArrayAppendArray(Mutable, GlyphRuns, v31);
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v13);
        }

        v18 = (const __CTLine *)CTLineCreateWithRunArray();
        v19 = objc_msgSend(NSNumber, "numberWithDouble:", CTLineGetTypographicBounds(v18, 0, 0, 0));
        [v7 addObject:v19];

        CFArrayAppendValue(theArray, v18);
        CFRelease(v18);
        CFRelease(Mutable);
        id v3 = v10;
      }
    }
    v4 = objc_opt_new();
    v20 = (void *)v4[2];
    v4[1] = theArray;
    v4[2] = v7;

    v21 = [v3 firstObject];
    v4[3] = CFRetain((CFTypeRef)[v21 font]);
  }

  return v4;
}

+ (id)textRunResponseWithFont:(__CTFont *)a3
{
  v4 = objc_opt_new();
  v4[1] = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  uint64_t v5 = objc_opt_new();
  v6 = (void *)v4[2];
  v4[2] = v5;

  v4[3] = CFRetain(a3);

  return v4;
}

@end