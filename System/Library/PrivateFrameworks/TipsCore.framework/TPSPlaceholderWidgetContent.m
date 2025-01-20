@interface TPSPlaceholderWidgetContent
- (id)bodyText;
- (id)titleContent;
@end

@implementation TPSPlaceholderWidgetContent

- (id)titleContent
{
  v15[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"type";
  v13[1] = @"text";
  v14[0] = @"text";
  v14[1] = @"– – – – ";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];
  v15[0] = v2;
  v11[0] = @"type";
  v11[1] = @"text";
  v12[0] = @"text";
  v12[1] = @"– – – – – – – – – – – – –";
  v11[2] = @"marks";
  v8 = @"type";
  v9 = @"accentColor";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v10 = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
  v12[2] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:3];
  v15[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  return v6;
}

- (id)bodyText
{
  return @"– – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – – ";
}

@end