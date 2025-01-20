@interface MRMutableTextEditingAttributes
- (void)setInputTraits:(_MRTextInputTraits *)a3;
- (void)setPrompt:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation MRMutableTextEditingAttributes

- (void)setTitle:(id)a3
{
  if (self->super._title != a3)
  {
    v4 = (NSString *)[a3 copy];
    title = self->super._title;
    self->super._title = v4;
    MEMORY[0x1F41817F8](v4, title);
  }
}

- (void)setPrompt:(id)a3
{
  if (self->super._prompt != a3)
  {
    v4 = (NSString *)[a3 copy];
    prompt = self->super._prompt;
    self->super._prompt = v4;
    MEMORY[0x1F41817F8](v4, prompt);
  }
}

- (void)setInputTraits:(_MRTextInputTraits *)a3
{
  *(_OWORD *)&self->super._inputTraits.autocapitalizationType = *(_OWORD *)&a3->autocapitalizationType;
  long long v3 = *(_OWORD *)&a3->returnKeyType;
  long long v4 = *(_OWORD *)&a3->validTextRange.length;
  long long v5 = *(_OWORD *)a3->PINEntrySeparatorIndexes;
  *(_OWORD *)&self->super._inputTraits.PINEntrySeparatorIndexes[2] = *(_OWORD *)&a3->PINEntrySeparatorIndexes[2];
  *(_OWORD *)self->super._inputTraits.PINEntrySeparatorIndexes = v5;
  *(_OWORD *)&self->super._inputTraits.validTextRange.length = v4;
  *(_OWORD *)&self->super._inputTraits.returnKeyType = v3;
  long long v6 = *(_OWORD *)&a3->PINEntrySeparatorIndexes[4];
  long long v7 = *(_OWORD *)&a3->PINEntrySeparatorIndexes[6];
  long long v8 = *(_OWORD *)&a3->PINEntrySeparatorIndexes[8];
  self->super._inputTraits.PINEntrySeparatorIndexesCount = a3->PINEntrySeparatorIndexesCount;
  *(_OWORD *)&self->super._inputTraits.PINEntrySeparatorIndexes[8] = v8;
  *(_OWORD *)&self->super._inputTraits.PINEntrySeparatorIndexes[6] = v7;
  *(_OWORD *)&self->super._inputTraits.PINEntrySeparatorIndexes[4] = v6;
}

@end