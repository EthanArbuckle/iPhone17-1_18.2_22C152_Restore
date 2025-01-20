@interface TBXMLHelper
- (BOOL)parse;
- (NSDictionary)sceneSettings;
- (TBXMLHelper)initWithContentsOfURL:(id)a3;
- (void)dealloc;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation TBXMLHelper

- (TBXMLHelper)initWithContentsOfURL:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TBXMLHelper;
  v4 = [(TBXMLHelper *)&v7 init];
  if (v4)
  {
    v5 = (NSXMLParser *)[objc_alloc(MEMORY[0x1E4F29250]) initWithContentsOfURL:a3];
    v4->_parser = v5;
    [(NSXMLParser *)v5 setDelegate:v4];
    v4->_depth = 0;
    v4->_successfullyEndedParsing = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TBXMLHelper;
  [(TBXMLHelper *)&v3 dealloc];
}

- (BOOL)parse
{
  return [(NSXMLParser *)self->_parser parse] || self->_successfullyEndedParsing;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  if (self->_interested)
  {

    self->_key = (NSString *)a4;
  }
  if (objc_msgSend(a4, "isEqualToString:", @"sceneSettings", a4, a5, a6, a7)) {
    goto LABEL_8;
  }
  if (![a4 isEqualToString:@"description"] || self->_depth != 1)
  {
    if (![a4 isEqualToString:@"template"]) {
      goto LABEL_9;
    }
LABEL_8:
    self->_interested = 1;
    goto LABEL_9;
  }
  self->_interested = 1;

  self->_key = (NSString *)a4;
LABEL_9:
  ++self->_depth;
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if (([a4 isEqualToString:@"sceneSettings"] & 1) != 0
    || [a4 isEqualToString:@"description"] && self->_depth == 1)
  {
    self->_interested = 0;
  }
  --self->_depth;
  if ([a4 isEqualToString:@"sceneSettings"])
  {
    [a3 abortParsing];
    self->_successfullyEndedParsing = 1;
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  if (self->_interested)
  {
    if (!self->_settings) {
      self->_settings = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    if (objc_msgSend((id)objc_msgSend(a4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet", a3)), "length"))
    {
      if ([(NSMutableDictionary *)self->_settings objectForKey:self->_key]) {
        v6 = (__CFString *)[(NSMutableDictionary *)self->_settings objectForKey:self->_key];
      }
      else {
        v6 = &stru_1F119C770;
      }
      uint64_t v7 = [NSString stringWithFormat:@"%@%@", v6, a4];
      settings = self->_settings;
      key = self->_key;
      [(NSMutableDictionary *)settings setObject:v7 forKey:key];
    }
  }
}

- (NSDictionary)sceneSettings
{
  return &self->_settings->super;
}

@end