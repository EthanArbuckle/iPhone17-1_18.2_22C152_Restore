@interface SXUnitConverterFactory
- (id)createUnitConverterWithComponentWidth:(double)a3 parentWidth:(double)a4 layoutOptions:(id)a5;
@end

@implementation SXUnitConverterFactory

- (id)createUnitConverterWithComponentWidth:(double)a3 parentWidth:(double)a4 layoutOptions:(id)a5
{
  id v7 = a5;
  v8 = [SXUnitConverter alloc];
  v9 = [v7 columnLayout];
  double v10 = (double)[v9 gutter];
  v11 = [v7 columnLayout];
  [v11 leftMargin];
  double v13 = v12;
  v14 = [v7 columnLayout];
  [v14 viewportSize];
  double v16 = v15;
  double v18 = v17;
  [v7 contentScaleFactor];
  double v20 = v19;

  v21 = -[SXUnitConverter initWithComponentWidth:parentWidth:documentGutter:documentMargin:viewportSize:contentScaleFactor:](v8, "initWithComponentWidth:parentWidth:documentGutter:documentMargin:viewportSize:contentScaleFactor:", a3, a4, v10, v13, v16, v18, v20);
  return v21;
}

@end