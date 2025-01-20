@interface BKLibraryRightsParser
- (BKLibraryRightsParser)init;
- (NSData)sinfData;
- (NSMutableDictionary)rightsInfo;
- (NSMutableString)foundText;
- (NSString)rightsId;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCDATA:(id)a4;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)setFoundText:(id)a3;
- (void)setRightsId:(id)a3;
- (void)setRightsInfo:(id)a3;
- (void)setSinfData:(id)a3;
@end

@implementation BKLibraryRightsParser

- (BKLibraryRightsParser)init
{
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryRightsParser;
  v2 = [(BKLibraryRightsParser *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    rightsInfo = v2->_rightsInfo;
    v2->_rightsInfo = v3;

    v5 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    foundText = v2->_foundText;
    v2->_foundText = v5;
  }
  return v2;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v10 = a5;
  if ([a4 isEqualToString:@"sinf"]
    && [v10 isEqualToString:@"http://itunes.apple.com/ns/epub"])
  {
    [(BKLibraryRightsParser *)self setRightsId:0];
    [(BKLibraryRightsParser *)self setSinfData:0];
  }
  v9 = [(BKLibraryRightsParser *)self foundText];
  [v9 setString:&stru_D4160];
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = a4;
  id v6 = [(BKLibraryRightsParser *)self foundText];
  [v6 appendString:v5];
}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v5 = a4;
  id v7 = [objc_alloc((Class)NSString) initWithData:v5 encoding:4];

  if ([v7 length])
  {
    id v6 = [(BKLibraryRightsParser *)self foundText];
    [v6 appendString:v7];
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v20 = a4;
  id v8 = a5;
  if ([v20 isEqualToString:@"sID"]
    && [v8 isEqualToString:@"http://itunes.apple.com/ns/epub"])
  {
    v9 = [(BKLibraryRightsParser *)self foundText];
    [(BKLibraryRightsParser *)self setRightsId:v9];

    goto LABEL_17;
  }
  if ([v20 isEqualToString:@"sData"]
    && [v8 isEqualToString:@"http://itunes.apple.com/ns/epub"])
  {
    id v10 = [(BKLibraryRightsParser *)self foundText];
    if ([v10 length])
    {
      id v11 = objc_alloc((Class)NSData);
      v12 = [(BKLibraryRightsParser *)self foundText];
      id v13 = [v11 initWithBase64EncodedString:v12 options:0];
    }
    else
    {
      id v13 = 0;
    }

    [(BKLibraryRightsParser *)self setSinfData:v13];
    goto LABEL_17;
  }
  if ([v20 isEqualToString:@"sinf"]
    && [v8 isEqualToString:@"http://itunes.apple.com/ns/epub"])
  {
    v14 = [(BKLibraryRightsParser *)self rightsId];
    if ([v14 length])
    {
      v15 = [(BKLibraryRightsParser *)self sinfData];
      id v16 = [v15 length];

      if (!v16)
      {
LABEL_14:
        [(BKLibraryRightsParser *)self setRightsId:0];
        [(BKLibraryRightsParser *)self setSinfData:0];
        goto LABEL_17;
      }
      v14 = [(BKLibraryRightsParser *)self sinfData];
      v17 = [(BKLibraryRightsParser *)self rightsInfo];
      v18 = [(BKLibraryRightsParser *)self rightsId];
      [v17 setObject:v14 forKeyedSubscript:v18];
    }
    goto LABEL_14;
  }
LABEL_17:
  v19 = [(BKLibraryRightsParser *)self foundText];
  [v19 setString:&stru_D4160];
}

- (NSMutableDictionary)rightsInfo
{
  return self->_rightsInfo;
}

- (void)setRightsInfo:(id)a3
{
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
{
}

- (NSString)rightsId
{
  return self->_rightsId;
}

- (void)setRightsId:(id)a3
{
}

- (NSMutableString)foundText
{
  return self->_foundText;
}

- (void)setFoundText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundText, 0);
  objc_storeStrong((id *)&self->_rightsId, 0);
  objc_storeStrong((id *)&self->_sinfData, 0);

  objc_storeStrong((id *)&self->_rightsInfo, 0);
}

@end