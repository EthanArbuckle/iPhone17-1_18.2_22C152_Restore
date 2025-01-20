@interface UIPDFParserDelegate
- (BOOL)parserError;
- (CGPath)path;
- (UIPDFParserDelegate)init;
- (void)dealloc;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
@end

@implementation UIPDFParserDelegate

- (UIPDFParserDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)UIPDFParserDelegate;
  result = [(UIPDFParserDelegate *)&v3 init];
  if (result)
  {
    result->_path = 0;
    result->_parserError = 0;
  }
  return result;
}

- (void)dealloc
{
  CGPathRelease(self->_path);
  v3.receiver = self;
  v3.super_class = (Class)UIPDFParserDelegate;
  [(UIPDFParserDelegate *)&v3 dealloc];
}

- (CGPath)path
{
  return self->_path;
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  self->_parserError = 1;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  if ([a4 isEqualToString:@"UIPDFSelection"])
  {
    self->_path = CGPathCreateMutable();
    return;
  }
  if ([a4 isEqualToString:@"Rectangle"])
  {
    CGPoint v10 = (CGPoint)*MEMORY[0x1E4F1DAD8];
    self->_p[3] = (CGPoint)*MEMORY[0x1E4F1DAD8];
    self->_p[2] = v10;
    self->_p[1] = v10;
    self->_p[0] = v10;
    return;
  }
  if ([a4 isEqualToString:@"Point"])
  {
    v11 = (void *)[a7 valueForKey:@"id"];
    v12 = (void *)[a7 valueForKey:@"x"];
    uint64_t v13 = [a7 valueForKey:@"y"];
    if (v11)
    {
      if (v12)
      {
        v14 = (void *)v13;
        if (v13)
        {
          [v12 floatValue];
          float v16 = v15;
          [v14 floatValue];
          float v18 = v17;
          if ([v11 isEqualToString:@"bottomLeft"])
          {
            p = self->_p;
            uint64_t v20 = 16;
          }
          else if ([v11 isEqualToString:@"topLeft"])
          {
            p = &self->_p[1];
            uint64_t v20 = 32;
          }
          else if ([v11 isEqualToString:@"topRight"])
          {
            p = &self->_p[2];
            uint64_t v20 = 48;
          }
          else
          {
            if (![v11 isEqualToString:@"bottomRight"]) {
              return;
            }
            p = &self->_p[3];
            uint64_t v20 = 64;
          }
          p->x = v16;
          *(double *)((char *)&self->super.isa + v20) = v18;
        }
      }
    }
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if (([a4 isEqualToString:@"UIPDFSelection"] & 1) == 0)
  {
    if ([a4 isEqualToString:@"Rectangle"])
    {
      CGPathAddLines(self->_path, 0, self->_p, 4uLL);
      path = self->_path;
      CGPathCloseSubpath(path);
    }
    else
    {
      [a4 isEqualToString:@"Point"];
    }
  }
}

- (BOOL)parserError
{
  return self->_parserError;
}

@end