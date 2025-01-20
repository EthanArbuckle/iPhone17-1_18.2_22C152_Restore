@interface MSVLyricsXMLElement
- (NSMutableString)mutableText;
- (NSString)elementName;
- (NSString)identifier;
- (id)description;
- (void)setElementName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMutableText:(id)a3;
@end

@implementation MSVLyricsXMLElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_elementName, 0);
}

- (void)setMutableText:(id)a3
{
}

- (NSMutableString)mutableText
{
  return self->_mutableText;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setElementName:(id)a3
{
}

- (NSString)elementName
{
  return self->_elementName;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MSVLyricsXMLElement *)self elementName];
  v6 = [(MSVLyricsXMLElement *)self identifier];
  v7 = [v3 stringWithFormat:@"<%@ %p> Name: %@, identifier: %@", v4, self, v5, v6];

  return v7;
}

@end