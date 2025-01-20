@interface _SFPBRFVisualElement
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (_SFPBRFImageElement)image_element;
- (_SFPBRFVisualElement)initWithDictionary:(id)a3;
- (_SFPBRFVisualElement)initWithFacade:(id)a3;
- (_SFPBRFVisualElement)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)whichElement;
- (void)setImage_element:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBRFVisualElement

- (_SFPBRFVisualElement)initWithFacade:(id)a3
{
  id v4 = a3;
  v5 = [(_SFPBRFVisualElement *)self init];
  if (v5)
  {
    if (objc_msgSend(v4, "hasImage_element"))
    {
      v6 = objc_msgSend(v4, "image_element");

      if (v6)
      {
        v7 = [_SFPBRFImageElement alloc];
        v8 = objc_msgSend(v4, "image_element");
        v9 = [(_SFPBRFImageElement *)v7 initWithFacade:v8];
        [(_SFPBRFVisualElement *)v5 setImage_element:v9];
      }
    }
    v10 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
}

- (unint64_t)whichElement
{
  return self->_whichElement;
}

- (_SFPBRFVisualElement)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_SFPBRFVisualElement;
  v5 = [(_SFPBRFVisualElement *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"imageElement"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[_SFPBRFImageElement alloc] initWithDictionary:v6];
      [(_SFPBRFVisualElement *)v5 setImage_element:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (_SFPBRFVisualElement)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBRFVisualElement *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBRFVisualElement *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_image_element)
  {
    id v4 = [(_SFPBRFVisualElement *)self image_element];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"imageElement"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"imageElement"];
    }
  }
  return v3;
}

- (unint64_t)hash
{
  return [(_SFPBRFImageElement *)self->_image_element hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(_SFPBRFVisualElement *)self image_element];
    v6 = objc_msgSend(v4, "image_element");
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(_SFPBRFVisualElement *)self image_element];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(_SFPBRFVisualElement *)self image_element];
      v11 = objc_msgSend(v4, "image_element");
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(_SFPBRFVisualElement *)self image_element];
  if (v4) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBRFVisualElementReadFrom(self, (uint64_t)a3);
}

- (_SFPBRFImageElement)image_element
{
  if (self->_whichElement == 1) {
    v2 = self->_image_element;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setImage_element:(id)a3
{
  self->_whichElement = a3 != 0;
  objc_storeStrong((id *)&self->_image_element, a3);
}

@end