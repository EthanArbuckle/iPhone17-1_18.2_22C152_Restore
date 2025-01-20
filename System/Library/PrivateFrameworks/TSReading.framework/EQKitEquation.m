@interface EQKitEquation
+ (id)equationSourceFromPDFDocument:(CGPDFDocument *)a3;
+ (id)equationWithData:(id)a3 format:(int)a4 environment:(id)a5 error:(id *)a6;
+ (id)equationWithString:(id)a3 format:(int)a4 environment:(id)a5 error:(id *)a6;
+ (id)equationWithString:(id)a3 format:(int)a4 error:(id *)a5;
+ (id)equationWithXMLDoc:(_xmlDoc *)a3 node:(_xmlNode *)a4 environment:(id)a5 error:(id *)a6;
+ (id)mathMLStringFromLaTeXString:(id)a3 environment:(id)a4 error:(id *)a5;
+ (int)formatFromData:(id)a3;
+ (int)formatFromString:(id)a3;
- (BOOL)exportToXMLWriter:(_xmlTextWriter *)a3 ns:(const char *)a4 prefix:(const char *)a5 characterCount:(int *)a6;
- (BOOL)isBaseFontNameUsed;
- (EQKitEnvironment)environment;
- (EQKitEquation)init;
- (EQKitEquation)initWithRoot:(id)a3 source:(id)a4;
- (EQKitExpression)root;
- (id)description;
- (id)newLayout;
- (id)pdfDataWithLayout:(id)a3 layoutContext:(id)a4;
- (id)pdfDataWithLayoutContext:(id)a3 baselineOffset:(double *)a4;
- (void)dealloc;
@end

@implementation EQKitEquation

- (EQKitEquation)init
{
  return [(EQKitEquation *)self initWithRoot:0 source:0];
}

- (EQKitEquation)initWithRoot:(id)a3 source:(id)a4
{
  if (!a3) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EQKitEquation.mm", 333, @"invalid root");
  }
  v9.receiver = self;
  v9.super_class = (Class)EQKitEquation;
  v7 = [(EQKitEquation *)&v9 init];
  if (v7)
  {
    v7->mRoot = (EQKitExpression *)a3;
    v7->mSource = (NSData *)a4;
  }
  return v7;
}

+ (int)formatFromData:(id)a3
{
  return 0;
}

+ (int)formatFromString:(id)a3
{
  return 0;
}

+ (id)equationWithData:(id)a3 format:(int)a4 environment:(id)a5 error:(id *)a6
{
  if (a4 != 1)
  {
    if (!a4 && a6 && !*a6)
    {
      v7 = 0;
      *a6 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"EQKitErrorDomain", 0, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"String format unknown. String format should be LaTeX or MathML.", &stru_26D688A48, 0), *MEMORY[0x263F08320], 0));
      return v7;
    }
    return 0;
  }
  id v9 = a3;
  if (!v9) {
    return 0;
  }
  v10 = v9;
  if (xmlSAXVersion(&hdlr, 2))
  {
    v7 = 0;
  }
  else
  {
    hdlr.getEntity = EQKitMathMLParserGetEntity;
    int v11 = xmlSubstituteEntitiesDefault(1);
    ExternalEntityLoader = xmlGetExternalEntityLoader();
    xmlSetExternalEntityLoader((xmlExternalEntityLoader)NoExternalEntityLoader);
    v13 = xmlSAXParseMemory(&hdlr, (const char *)[v10 bytes], objc_msgSend(v10, "length"), 0);
    xmlSetExternalEntityLoader(ExternalEntityLoader);
    xmlSubstituteEntitiesDefault(v11);
    v7 = 0;
    if (a5 && v13)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v14 = a5;
      }
      else {
        id v14 = 0;
      }
      v15 = [[EQKitMathMLParser alloc] initWithDocument:v13 node:0 source:v10 environment:v14];
      v7 = [(EQKitMathMLParser *)v15 parse];
      if (a6 && !*a6) {
        *a6 = [(EQKitMathMLParser *)v15 error];
      }

      xmlFreeDoc(v13);
    }
  }
  if (a6 && !v7)
  {
    if (!*a6) {
      *a6 = (id)objc_msgSend(MEMORY[0x263F087E8], "errorWithDomain:code:userInfo:", @"EQKitErrorDomain", 0, objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", @"Unable to create equation.", &stru_26D688A48, 0), *MEMORY[0x263F08320], 0));
    }

    return 0;
  }

  if (v7) {
    v7[3] = a5;
  }
  return v7;
}

+ (id)equationWithString:(id)a3 format:(int)a4 environment:(id)a5 error:(id *)a6
{
  uint64_t v8 = *(void *)&a4;
  v10 = (const char *)[a3 UTF8String];
  uint64_t v11 = [MEMORY[0x263EFF8F8] dataWithBytes:v10 length:strlen(v10)];

  return (id)[a1 equationWithData:v11 format:v8 environment:a5 error:a6];
}

+ (id)equationWithString:(id)a3 format:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v8 = (const char *)[a3 UTF8String];
  uint64_t v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:strlen(v8)];
  id v10 = +[EQKitEnvironment defaultEnvironment];

  return (id)[a1 equationWithData:v9 format:v6 environment:v10 error:a5];
}

+ (id)equationWithXMLDoc:(_xmlDoc *)a3 node:(_xmlNode *)a4 environment:(id)a5 error:(id *)a6
{
  id v6 = 0;
  if (a3 && a4)
  {
    uint64_t v11 = [EQKitMathMLParser alloc];
    uint64_t v12 = objc_opt_class();
    v13 = [(EQKitMathMLParser *)v11 initWithDocument:a3 node:a4 source:0 environment:EQKitUtilDynamicCast(v12, (uint64_t)a5)];
    id v6 = [(EQKitMathMLParser *)v13 parse];
    if (a6) {
      *a6 = [(EQKitMathMLParser *)v13 error];
    }
  }
  return v6;
}

- (BOOL)exportToXMLWriter:(_xmlTextWriter *)a3 ns:(const char *)a4 prefix:(const char *)a5 characterCount:(int *)a6
{
  return 0;
}

- (id)pdfDataWithLayoutContext:(id)a3 baselineOffset:(double *)a4
{
  v7 = (void *)[(EQKitExpression *)[(EQKitEquation *)self root] newLayout];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  [v7 layoutWithContext:a3];
  id v9 = [(EQKitEquation *)self pdfDataWithLayout:v8 layoutContext:a3];
  if (a4)
  {
    [v8 depth];
    *a4 = -v10;
  }

  return v9;
}

- (id)pdfDataWithLayout:(id)a3 layoutContext:(id)a4
{
  return 0;
}

+ (id)equationSourceFromPDFDocument:(CGPDFDocument *)a3
{
  return 0;
}

- (BOOL)isBaseFontNameUsed
{
  return [(EQKitExpression *)self->mRoot isBaseFontNameUsed];
}

- (id)newLayout
{
  return (id)[(EQKitExpression *)self->mRoot newLayout];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EQKitEquation;
  [(EQKitEquation *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@ %p root=%@>", NSStringFromClass(v4), self, self->mRoot];
}

+ (id)mathMLStringFromLaTeXString:(id)a3 environment:(id)a4 error:(id *)a5
{
  return 0;
}

- (EQKitExpression)root
{
  return self->mRoot;
}

- (EQKitEnvironment)environment
{
  return self->mEnvironment;
}

@end