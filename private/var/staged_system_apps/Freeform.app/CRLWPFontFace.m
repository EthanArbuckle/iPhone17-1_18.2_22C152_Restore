@interface CRLWPFontFace
+ (id)fontFaceWithPostScriptName:(id)a3 faceName:(id)a4;
- (CRLWPFontFace)initWithPostScriptName:(id)a3 faceName:(id)a4;
- (NSString)faceName;
- (NSString)postScriptName;
- (id)description;
- (void)setFaceName:(id)a3;
- (void)setPostScriptName:(id)a3;
@end

@implementation CRLWPFontFace

+ (id)fontFaceWithPostScriptName:(id)a3 faceName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithPostScriptName:v6 faceName:v5];

  return v7;
}

- (CRLWPFontFace)initWithPostScriptName:(id)a3 faceName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CRLWPFontFace;
  v8 = [(CRLWPFontFace *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CRLWPFontFace *)v8 setPostScriptName:v6];
    [(CRLWPFontFace *)v9 setFaceName:v7];
  }

  return v9;
}

- (id)description
{
  return +[NSString stringWithFormat:@"(%@*) %p %@ %@", objc_opt_class(), self, self->_postScriptName, self->_faceName];
}

- (NSString)postScriptName
{
  return self->_postScriptName;
}

- (void)setPostScriptName:(id)a3
{
}

- (NSString)faceName
{
  return self->_faceName;
}

- (void)setFaceName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceName, 0);

  objc_storeStrong((id *)&self->_postScriptName, 0);
}

@end