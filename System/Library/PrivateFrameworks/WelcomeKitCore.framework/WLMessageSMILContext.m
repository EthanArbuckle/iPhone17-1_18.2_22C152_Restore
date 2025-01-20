@interface WLMessageSMILContext
- (NSArray)parts;
- (NSString)characters;
- (WLMessageSMILContext)init;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation WLMessageSMILContext

- (WLMessageSMILContext)init
{
  v7.receiver = self;
  v7.super_class = (Class)WLMessageSMILContext;
  v2 = [(WLMessageSMILContext *)&v7 init];
  v3 = v2;
  if (v2)
  {
    characters = v2->_characters;
    v2->_characters = (NSString *)&stru_26DF81F20;

    parts = v3->_parts;
    v3->_parts = (NSArray *)MEMORY[0x263EFFA68];

    *(_WORD *)&v3->_inBody = 0;
  }
  return v3;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v11 = a7;
  id v12 = a4;
  _WLLog();
  objc_msgSend(v12, "lowercaseString", self, v12, a5, a6, v11);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  if (self->_inBody)
  {
    if (self->_inPar)
    {
      v13 = [[WLMessageSMILPart alloc] initWithElementName:v16 attributes:v11];
      v14 = [(NSArray *)self->_parts arrayByAddingObject:v13];
      parts = self->_parts;
      self->_parts = v14;
    }
    else if ([v16 isEqualToString:@"par"])
    {
      self->_inPar = 1;
    }
  }
  else if ([v16 isEqualToString:@"body"])
  {
    self->_inBody = 1;
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v9 = a4;
  _WLLog();
  objc_msgSend(v9, "lowercaseString", self, v9, a5, a6);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  p_inBody = &self->_inBody;
  if (self->_inBody)
  {
    BOOL inPar = self->_inPar;
    p_BOOL inPar = &self->_inPar;
    if (inPar)
    {
      if (([v13 isEqualToString:@"par"] & 1) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
    p_BOOL inPar = p_inBody;
    if ([v13 isEqualToString:@"body"]) {
LABEL_4:
    }
      BOOL *p_inPar = 0;
  }
LABEL_5:
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = a4;
  _WLLog();
  -[NSString stringByAppendingString:](self->_characters, "stringByAppendingString:", v5, self, v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  characters = self->_characters;
  self->_characters = v6;
}

- (NSString)characters
{
  return self->_characters;
}

- (NSArray)parts
{
  return self->_parts;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parts, 0);
  objc_storeStrong((id *)&self->_characters, 0);
}

@end