@interface PCXMPStringParser
- (PCXMPStringParser)init;
- (id)parseErrorString;
- (id)parsedData;
- (void)dealloc;
- (void)parseXMPData:(id)a3;
- (void)parseXMPString:(id)a3;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parserDidEndDocument:(id)a3;
- (void)parserDidStartDocument:(id)a3;
@end

@implementation PCXMPStringParser

- (PCXMPStringParser)init
{
  v5.receiver = self;
  v5.super_class = (Class)PCXMPStringParser;
  v2 = [(PCXMPStringParser *)&v5 init];
  v3 = (PCXMPStringParser *)v2;
  if (v2)
  {
    *((void *)v2 + 9) = 0;
    *(_OWORD *)(v2 + 8) = 0u;
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 40) = 0u;
    *((void *)v2 + 7) = 0;
    *((void *)v2 + 8) = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:23];
    v3->parentTags1 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"rdf:SphericalVideo", @"x:xmpmeta", 0);
    v3->parentTags2 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"rdf:RDF", 0);
    v3->parentTags3 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"rdf:Description", 0);
  }
  return v3;
}

- (void)dealloc
{
  [(PCXMPStringParser *)self parserDidEndDocument:0];
  mDict = self->mDict;
  if (mDict) {

  }
  parentTags1 = self->parentTags1;
  if (parentTags1) {

  }
  parentTags2 = self->parentTags2;
  if (parentTags2) {

  }
  parentTags3 = self->parentTags3;
  if (parentTags3) {

  }
  v7.receiver = self;
  v7.super_class = (Class)PCXMPStringParser;
  [(PCXMPStringParser *)&v7 dealloc];
}

- (void)parseXMPString:(id)a3
{
  objc_super v5 = (void *)MEMORY[0x1BA9C0A20](self, a2);
  -[PCXMPStringParser parseXMPData:](self, "parseXMPData:", [a3 dataUsingEncoding:4]);
}

- (void)parseXMPData:(id)a3
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F29250]) initWithData:a3];
  [v4 setDelegate:self];
  [v4 parse];
}

- (id)parsedData
{
  return self->mDict;
}

- (id)parseErrorString
{
  return self->xmlError;
}

- (void)parserDidStartDocument:(id)a3
{
  [(PCXMPStringParser *)self parserDidEndDocument:a3];
  self->tagParent1 = (NSMutableString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F119C770];
  self->tagParent2 = (NSMutableString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F119C770];
  self->tagParent3 = (NSMutableString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F119C770];
  mDict = self->mDict;

  [(NSMutableDictionary *)mDict removeAllObjects];
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  if ([(NSArray *)self->parentTags1 containsObject:a4])
  {
    [(NSMutableString *)self->tagParent1 setString:a4];
    [(NSMutableString *)self->tagParent2 setString:&stru_1F119C770];
    [(NSMutableString *)self->tagParent3 setString:&stru_1F119C770];
    tagDict1 = self->tagDict1;
    if (tagDict1) {

    }
    self->tagDict1 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:47];
    tagDict2 = self->tagDict2;
    if (tagDict2)
    {

      self->tagDict2 = 0;
    }
  }
  else if ([(NSArray *)self->parentTags2 containsObject:a4])
  {
    [(NSMutableString *)self->tagParent2 setString:a4];
    [(NSMutableString *)self->tagParent3 setString:&stru_1F119C770];
    v12 = self->tagDict2;
    if (v12) {

    }
    self->tagDict2 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:47];
  }
  else if ([(NSArray *)self->parentTags3 containsObject:a4])
  {
    [(NSMutableString *)self->tagParent3 setString:a4];
    tagDict3 = self->tagDict3;
    if (tagDict3) {

    }
    self->tagDict3 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:47];
  }
  valueString = self->valueString;
  if (valueString) {

  }
  self->valueString = (NSMutableString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:&stru_1F119C770];
  if (a7 && [a7 count])
  {
    mDict = self->tagDict3;
    if (!mDict)
    {
      mDict = self->tagDict2;
      if (!mDict)
      {
        mDict = self->tagDict1;
        if (!mDict) {
          mDict = self->mDict;
        }
      }
    }
    [(NSMutableDictionary *)mDict setObject:a7 forKey:a4];
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  valueString = self->valueString;
  if (valueString) {
    [(NSMutableString *)valueString appendString:a4];
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if ([(NSArray *)self->parentTags1 containsObject:a4])
  {
    tagDict3 = self->tagDict3;
    if (tagDict3)
    {
      tagDict2 = self->tagDict2;
      if (!tagDict2)
      {
        tagDict2 = self->tagDict1;
        if (!tagDict2) {
          tagDict2 = self->mDict;
        }
      }
      if ([(NSMutableDictionary *)tagDict3 count]) {
        [(NSMutableDictionary *)tagDict2 setValue:self->tagDict3 forKey:(id)[(NSMutableString *)self->tagParent3 copy]];
      }

      self->tagDict3 = 0;
      [(NSMutableString *)self->tagParent3 setString:&stru_1F119C770];
    }
    v10 = self->tagDict2;
    if (v10)
    {
      tagDict1 = self->tagDict1;
      if (!tagDict1) {
        tagDict1 = self->mDict;
      }
      if ([(NSMutableDictionary *)v10 count]) {
        [(NSMutableDictionary *)tagDict1 setValue:self->tagDict2 forKey:(id)[(NSMutableString *)self->tagParent2 copy]];
      }

      self->tagDict2 = 0;
      [(NSMutableString *)self->tagParent2 setString:&stru_1F119C770];
    }
    v12 = self->tagDict1;
    if (v12)
    {
      if ([(NSMutableDictionary *)v12 count]) {
        [(NSMutableDictionary *)self->mDict setValue:self->tagDict1 forKey:(id)[(NSMutableString *)self->tagParent1 copy]];
      }

      self->tagDict1 = 0;
    }
    tagParent1 = self->tagParent1;
LABEL_44:
    [(NSMutableString *)tagParent1 setString:&stru_1F119C770];
    return;
  }
  if ([(NSArray *)self->parentTags2 containsObject:a4])
  {
    v14 = self->tagDict3;
    if (v14)
    {
      mDict = self->tagDict2;
      if (!mDict)
      {
        mDict = self->tagDict1;
        if (!mDict) {
          mDict = self->mDict;
        }
      }
      if ([(NSMutableDictionary *)v14 count]) {
        [(NSMutableDictionary *)mDict setValue:self->tagDict3 forKey:(id)[(NSMutableString *)self->tagParent3 copy]];
      }

      self->tagDict3 = 0;
      [(NSMutableString *)self->tagParent3 setString:&stru_1F119C770];
    }
    v16 = self->tagDict2;
    if (v16)
    {
      v17 = self->tagDict1;
      if (!v17) {
        v17 = self->mDict;
      }
      if ([(NSMutableDictionary *)v16 count]) {
        [(NSMutableDictionary *)v17 setValue:self->tagDict2 forKey:(id)[(NSMutableString *)self->tagParent2 copy]];
      }

      self->tagDict2 = 0;
    }
    tagParent1 = self->tagParent2;
    goto LABEL_44;
  }
  if ([(NSArray *)self->parentTags3 containsObject:a4])
  {
    v18 = self->tagDict3;
    if (v18)
    {
      v19 = self->tagDict2;
      if (!v19)
      {
        v19 = self->tagDict1;
        if (!v19) {
          v19 = self->mDict;
        }
      }
      if ([(NSMutableDictionary *)v18 count]) {
        [(NSMutableDictionary *)v19 setValue:self->tagDict3 forKey:(id)[(NSMutableString *)self->tagParent3 copy]];
      }

      self->tagDict3 = 0;
    }
    tagParent1 = self->tagParent3;
    goto LABEL_44;
  }
  if (self->valueString)
  {
    v20 = self->tagDict3;
    if (!v20)
    {
      v20 = self->tagDict2;
      if (!v20)
      {
        v20 = self->tagDict1;
        if (!v20) {
          v20 = self->mDict;
        }
      }
    }
    uint64_t v21 = [(NSMutableDictionary *)v20 objectForKey:a4];
    if (v21)
    {
      uint64_t v22 = v21;
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = (NSMutableString *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v22];
        v24 = v23;
        valueString = self->valueString;
        id v26 = a4;
      }
      else
      {
        v24 = (NSMutableString *)[MEMORY[0x1E4F1CA60] dictionary];
        -[NSMutableString setObject:forKey:](v24, "setObject:forKey:", v22, [a4 stringByAppendingString:@"-0"]);
        v27 = self->valueString;
        id v26 = (id)[a4 stringByAppendingString:@"-1"];
        v23 = v24;
        valueString = v27;
      }
      [(NSMutableString *)v23 setObject:valueString forKey:v26];
    }
    else
    {
      v24 = self->valueString;
    }
    [(NSMutableDictionary *)v20 setValue:v24 forKey:a4];

    self->valueString = 0;
  }
}

- (void)parserDidEndDocument:(id)a3
{
  tagParent1 = self->tagParent1;
  if (tagParent1)
  {

    self->tagParent1 = 0;
  }
  tagParent2 = self->tagParent2;
  if (tagParent2)
  {

    self->tagParent2 = 0;
  }
  tagParent3 = self->tagParent3;
  if (tagParent3)
  {

    self->tagParent3 = 0;
  }
  valueString = self->valueString;
  if (valueString)
  {

    self->valueString = 0;
  }
  tagDict1 = self->tagDict1;
  if (tagDict1)
  {

    self->tagDict1 = 0;
  }
  tagDict2 = self->tagDict2;
  if (tagDict2)
  {

    self->tagDict2 = 0;
  }
  tagDict3 = self->tagDict3;
  if (tagDict3)
  {

    self->tagDict3 = 0;
  }
  xmlError = self->xmlError;
  if (xmlError)
  {

    self->xmlError = 0;
  }
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  xmlError = self->xmlError;
  if (xmlError) {

  }
  v8 = (NSString *)[NSString stringWithFormat:@"XML Parse Error %i, Description: %@, Line: %i", objc_msgSend(a4, "code"), objc_msgSend(a4, "localizedDescription"), objc_msgSend(a3, "lineNumber")];
  self->xmlError = v8;

  v9 = v8;
}

@end