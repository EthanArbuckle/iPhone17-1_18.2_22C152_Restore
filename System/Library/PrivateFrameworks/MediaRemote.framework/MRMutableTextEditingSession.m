@interface MRMutableTextEditingSession
- (void)setAttributes:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation MRMutableTextEditingSession

- (void)setText:(id)a3
{
  if (self->super._text != a3)
  {
    v4 = (NSString *)[a3 copy];
    text = self->super._text;
    self->super._text = v4;
    MEMORY[0x1F41817F8](v4, text);
  }
}

- (void)setEditing:(BOOL)a3
{
  self->super._editing = a3;
}

- (void)setAttributes:(id)a3
{
  v5 = (MRTextEditingAttributes *)a3;
  attributes = self->super._attributes;
  p_attributes = &self->super._attributes;
  if (attributes != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_attributes, a3);
    v5 = v8;
  }
}

@end