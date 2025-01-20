@interface TYParsedLatexData
- (BOOL)isLatexString;
- (CGSize)boundingSize;
- (NSArray)annotatedTextDirections;
- (NSArray)latexFormulaBoundingBoxes;
- (NSString)convertedString;
- (NSString)string;
- (TYParsedLatexData)initWithString:(id)a3 isLatex:(BOOL)a4;
- (double)offsetY;
- (void)_convertFormula;
- (void)setAnnotatedTextDirections:(id)a3;
- (void)setBoundingSize:(CGSize)a3;
- (void)setConvertedString:(id)a3;
- (void)setIsLatexString:(BOOL)a3;
- (void)setLatexFormulaBoundingBoxes:(id)a3;
- (void)setOffsetY:(double)a3;
- (void)setString:(id)a3;
@end

@implementation TYParsedLatexData

- (void)_convertFormula
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  v32 = self;
  v4 = [(TYParsedLatexData *)self string];
  id v48 = 0;
  v33 = v3;
  v5 = [v3 getBoundingBoxWithLatex:v4 error:&v48];
  id v31 = v48;

  v36 = objc_opt_new();
  v6 = objc_opt_new();
  v39 = +[TypistLatexSymbolTranslation latexSymbolMap];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v5;
  uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v37)
  {
    uint64_t v35 = *(void *)v45;
    double v7 = 0.0;
    double v8 = -3.40282347e38;
    double v9 = 3.40282347e38;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v45 != v35) {
          objc_enumerationMutation(obj);
        }
        uint64_t v38 = v10;
        v11 = *(void **)(*((void *)&v44 + 1) + 8 * v10);
        v12 = objc_opt_new();
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        v13 = [v11 allKeys];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v41 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
              v19 = [v11 objectForKey:v18];
              [v19 CGRectValue];
              double v22 = v20 + v21;
              double v25 = v23 + v24;
              if (v22 >= v20) {
                double v26 = v20;
              }
              else {
                double v26 = v22;
              }
              if (v22 >= v20) {
                double v20 = v22;
              }
              if (v26 < v9) {
                double v9 = v26;
              }
              if (v20 >= v8) {
                double v8 = v20;
              }
              if (v25 >= v7) {
                double v7 = v25;
              }
              uint64_t v27 = [v39 objectForKey:v18];
              v28 = (void *)v27;
              if (v27) {
                v29 = (void *)v27;
              }
              else {
                v29 = v18;
              }
              id v30 = v29;

              [v6 appendString:v30];
              [v12 setObject:v19 forKey:v30];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v15);
        }

        [v36 addObject:v12];
        uint64_t v10 = v38 + 1;
      }
      while (v38 + 1 != v37);
      uint64_t v37 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v37);
  }
  else
  {
    double v7 = 0.0;
    double v8 = -3.40282347e38;
    double v9 = 3.40282347e38;
  }

  [(TYParsedLatexData *)v32 setLatexFormulaBoundingBoxes:v36];
  [(TYParsedLatexData *)v32 setConvertedString:v6];
  -[TYParsedLatexData setBoundingSize:](v32, "setBoundingSize:", v7, v8 - v9);
  [(TYParsedLatexData *)v32 setOffsetY:v9];
}

- (TYParsedLatexData)initWithString:(id)a3 isLatex:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TYParsedLatexData;
  double v7 = [(TYParsedLatexData *)&v11 init];
  double v8 = v7;
  if (v7)
  {
    [(TYParsedLatexData *)v7 setString:v6];
    [(TYParsedLatexData *)v8 setIsLatexString:v4];
    if (v4)
    {
      [(TYParsedLatexData *)v8 _convertFormula];
      [(TYParsedLatexData *)v8 setAnnotatedTextDirections:0];
    }
    else
    {
      double v9 = [v6 textDirectionAnnotations];
      [(TYParsedLatexData *)v8 setAnnotatedTextDirections:v9];

      -[TYParsedLatexData setBoundingSize:](v8, "setBoundingSize:", 0.0, 0.0);
      [(TYParsedLatexData *)v8 setConvertedString:0];
      [(TYParsedLatexData *)v8 setLatexFormulaBoundingBoxes:0];
    }
  }

  return v8;
}

- (NSString)string
{
  return self->_string;
}

- (void)setString:(id)a3
{
}

- (NSString)convertedString
{
  return self->_convertedString;
}

- (void)setConvertedString:(id)a3
{
}

- (NSArray)latexFormulaBoundingBoxes
{
  return self->_latexFormulaBoundingBoxes;
}

- (void)setLatexFormulaBoundingBoxes:(id)a3
{
}

- (BOOL)isLatexString
{
  return self->_isLatexString;
}

- (void)setIsLatexString:(BOOL)a3
{
  self->_isLatexString = a3;
}

- (CGSize)boundingSize
{
  double width = self->_boundingSize.width;
  double height = self->_boundingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBoundingSize:(CGSize)a3
{
  self->_boundingSize = a3;
}

- (double)offsetY
{
  return self->_offsetY;
}

- (void)setOffsetY:(double)a3
{
  self->_offsetY = a3;
}

- (NSArray)annotatedTextDirections
{
  return self->_annotatedTextDirections;
}

- (void)setAnnotatedTextDirections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotatedTextDirections, 0);
  objc_storeStrong((id *)&self->_latexFormulaBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_convertedString, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end