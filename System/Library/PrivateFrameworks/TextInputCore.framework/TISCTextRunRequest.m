@interface TISCTextRunRequest
+ (id)textRunRequestWithStrings:(id)a3 color:(CGColor *)a4 maxFontSize:(double)a5 minFontSize:(double)a6 allowTruncation:(BOOL)a7 truncationSentinel:(id)a8 widthGroup:(unint64_t)a9;
- (BOOL)allowTruncation;
- (CGColor)color;
- (double)maxFontSize;
- (double)minFontSize;
- (id)strings;
- (id)truncationSentinel;
- (unint64_t)widthGroup;
- (void)dealloc;
@end

@implementation TISCTextRunRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncationSentinel, 0);

  objc_storeStrong((id *)&self->_strings, 0);
}

- (void)dealloc
{
  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)TISCTextRunRequest;
  [(TISCTextRunRequest *)&v3 dealloc];
}

- (unint64_t)widthGroup
{
  return self->_widthGroup;
}

- (id)truncationSentinel
{
  return self->_truncationSentinel;
}

- (BOOL)allowTruncation
{
  return self->_allowTruncation;
}

- (double)minFontSize
{
  return self->_minFontSize;
}

- (double)maxFontSize
{
  return self->_maxFontSize;
}

- (CGColor)color
{
  return self->_color;
}

- (id)strings
{
  return self->_strings;
}

+ (id)textRunRequestWithStrings:(id)a3 color:(CGColor *)a4 maxFontSize:(double)a5 minFontSize:(double)a6 allowTruncation:(BOOL)a7 truncationSentinel:(id)a8 widthGroup:(unint64_t)a9
{
  id v15 = a3;
  id v16 = a8;
  uint64_t v17 = objc_opt_new();
  v18 = *(void **)(v17 + 8);
  *(void *)(v17 + 8) = v15;
  id v19 = v15;

  *(void *)(v17 + 16) = CGColorRetain(a4);
  *(double *)(v17 + 24) = a5;
  *(double *)(v17 + 32) = a6;
  *(unsigned char *)(v17 + 40) = a7;
  uint64_t v20 = [v16 copy];

  v21 = *(void **)(v17 + 48);
  *(void *)(v17 + 48) = v20;

  *(void *)(v17 + 56) = a9;

  return (id)v17;
}

@end