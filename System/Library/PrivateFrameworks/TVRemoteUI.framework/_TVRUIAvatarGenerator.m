@interface _TVRUIAvatarGenerator
- (CNCancelable)avatarRenderer;
- (_TVRUIAvatarGenerator)init;
- (id)_initialsFromName:(id)a3;
- (void)generateAvatarForName:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6;
- (void)generateAvatarForText:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6;
- (void)setAvatarRenderer:(id)a3;
@end

@implementation _TVRUIAvatarGenerator

- (_TVRUIAvatarGenerator)init
{
  v3.receiver = self;
  v3.super_class = (Class)_TVRUIAvatarGenerator;
  return [(_TVRUIAvatarGenerator *)&v3 init];
}

- (void)generateAvatarForName:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a6;
  id v12 = a5;
  id v13 = [(_TVRUIAvatarGenerator *)self _initialsFromName:a3];
  -[_TVRUIAvatarGenerator generateAvatarForText:size:identifier:completion:](self, "generateAvatarForText:size:identifier:completion:", v13, v12, v11, width, height);
}

- (void)generateAvatarForText:(id)a3 size:(CGSize)a4 identifier:(id)a5 completion:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  if ([v11 length])
  {
    v14 = [MEMORY[0x263EFEBA8] defaultSettings];
    v15 = (void *)[objc_alloc(MEMORY[0x263EFEBA0]) initWithSettings:v14];
    v16 = objc_msgSend(MEMORY[0x263EFEBB0], "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, width, height, 2.0);
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __74___TVRUIAvatarGenerator_generateAvatarForText_size_identifier_completion___block_invoke;
    v21 = &unk_264800A38;
    id v23 = v13;
    id v22 = v12;
    v17 = [v15 renderMonogramForString:v11 scope:v16 imageHandler:&v18];
    -[_TVRUIAvatarGenerator setAvatarRenderer:](self, "setAvatarRenderer:", v17, v18, v19, v20, v21);
  }
  else
  {
    (*((void (**)(id, id, void))v13 + 2))(v13, v12, 0);
  }
}

- (id)_initialsFromName:(id)a3
{
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@" "];
  if ((unint64_t)[v4 count] >= 2)
  {
    v5 = [v4 firstObject];
    v6 = [v4 lastObject];
    if ([v5 length] && objc_msgSend(v6, "length"))
    {
      v7 = [v5 substringToIndex:1];
      v8 = [v6 substringToIndex:1];
      id v9 = [v7 stringByAppendingString:v8];

LABEL_8:
      goto LABEL_12;
    }

LABEL_10:
    goto LABEL_11;
  }
  if ([v4 count] == 1)
  {
    v5 = [v4 firstObject];
    if ([v5 length])
    {
      id v9 = [v5 substringToIndex:1];
      goto LABEL_8;
    }
    goto LABEL_10;
  }
LABEL_11:
  id v9 = v3;
LABEL_12:

  return v9;
}

- (CNCancelable)avatarRenderer
{
  return self->_avatarRenderer;
}

- (void)setAvatarRenderer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end