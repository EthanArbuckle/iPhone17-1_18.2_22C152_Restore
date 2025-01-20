@interface WFMenuItem
+ (id)platformImageForIcon:(id)a3;
- (BOOL)isDestructive;
- (NSString)subtitle;
- (NSString)title;
- (WFIcon)icon;
- (WFMenuItem)initWithTitle:(id)a3 handler:(id)a4;
- (WFMenuItem)initWithTitle:(id)a3 icon:(id)a4 handler:(id)a5;
- (WFMenuItem)initWithTitle:(id)a3 icon:(id)a4 isDestructive:(BOOL)a5 handler:(id)a6;
- (WFMenuItem)initWithTitle:(id)a3 icon:(id)a4 state:(int64_t)a5 handler:(id)a6;
- (WFMenuItem)initWithTitle:(id)a3 state:(int64_t)a4 handler:(id)a5;
- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 handler:(id)a5;
- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 handler:(id)a6;
- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 state:(int64_t)a6 handler:(id)a7;
- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 state:(int64_t)a6 isDestructive:(BOOL)a7 handler:(id)a8;
- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 state:(int64_t)a5 handler:(id)a6;
- (id)generateAttributedStringForText:(id)a3 font:(id)a4 color:(id)a5;
- (id)handler;
- (id)menuElementRepresentationShowingStatus:(BOOL)a3;
- (int64_t)state;
@end

@implementation WFMenuItem

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (id)handler
{
  return self->_handler;
}

- (BOOL)isDestructive
{
  return self->_isDestructive;
}

- (int64_t)state
{
  return self->_state;
}

- (WFIcon)icon
{
  return self->_icon;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)title
{
  return self->_title;
}

- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 state:(int64_t)a6 isDestructive:(BOOL)a7 handler:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a8;
  if (!v15)
  {
    v28 = [MEMORY[0x263F08690] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"WFMenuItem.m", 125, @"Invalid parameter not satisfying: %@", @"title" object file lineNumber description];
  }
  v29.receiver = self;
  v29.super_class = (Class)WFMenuItem;
  v19 = [(WFMenuItem *)&v29 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    title = v19->_title;
    v19->_title = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    subtitle = v19->_subtitle;
    v19->_subtitle = (NSString *)v22;

    objc_storeStrong((id *)&v19->_icon, a5);
    v19->_state = a6;
    v19->_isDestructive = a7;
    uint64_t v24 = [v18 copy];
    id handler = v19->_handler;
    v19->_id handler = (id)v24;

    v26 = v19;
  }

  return v19;
}

- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 state:(int64_t)a6 handler:(id)a7
{
  return [(WFMenuItem *)self initWithTitle:a3 subtitle:a4 icon:a5 state:a6 isDestructive:0 handler:a7];
}

- (WFMenuItem)initWithTitle:(id)a3 icon:(id)a4 isDestructive:(BOOL)a5 handler:(id)a6
{
  return [(WFMenuItem *)self initWithTitle:a3 subtitle:0 icon:a4 state:0 isDestructive:1 handler:a6];
}

- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 icon:(id)a5 handler:(id)a6
{
  return [(WFMenuItem *)self initWithTitle:a3 subtitle:a4 icon:a5 state:0 isDestructive:0 handler:a6];
}

- (WFMenuItem)initWithTitle:(id)a3 icon:(id)a4 state:(int64_t)a5 handler:(id)a6
{
  return [(WFMenuItem *)self initWithTitle:a3 subtitle:0 icon:a4 state:a5 isDestructive:0 handler:a6];
}

- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 state:(int64_t)a5 handler:(id)a6
{
  return [(WFMenuItem *)self initWithTitle:a3 subtitle:a4 icon:0 state:a5 isDestructive:0 handler:a6];
}

- (WFMenuItem)initWithTitle:(id)a3 state:(int64_t)a4 handler:(id)a5
{
  return [(WFMenuItem *)self initWithTitle:a3 subtitle:0 icon:0 state:a4 isDestructive:0 handler:a5];
}

- (WFMenuItem)initWithTitle:(id)a3 icon:(id)a4 handler:(id)a5
{
  return [(WFMenuItem *)self initWithTitle:a3 subtitle:0 icon:a4 state:0 isDestructive:0 handler:a5];
}

- (WFMenuItem)initWithTitle:(id)a3 subtitle:(id)a4 handler:(id)a5
{
  return [(WFMenuItem *)self initWithTitle:a3 subtitle:a4 icon:0 state:0 isDestructive:0 handler:a5];
}

- (WFMenuItem)initWithTitle:(id)a3 handler:(id)a4
{
  return [(WFMenuItem *)self initWithTitle:a3 subtitle:0 icon:0 state:0 isDestructive:0 handler:a4];
}

+ (id)platformImageForIcon:(id)a3
{
  id v3 = a3;
  if (!v3 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v4 = 0;
    goto LABEL_10;
  }
  v4 = v3;
  if (![v3 hasClearBackground])
  {
LABEL_10:
    v7 = objc_msgSend(MEMORY[0x263F87B70], "loadIcon:size:style:", v3, 0, 25.0, 25.0);
    goto LABEL_11;
  }
  v5 = [v3 symbolName];
  if ([(__CFString *)v5 hasSuffix:@".fill"])
  {
    uint64_t v6 = -[__CFString substringToIndex:](v5, "substringToIndex:", -[__CFString length](v5, "length") - [@".fill" length]);

    v5 = (__CFString *)v6;
  }
  if ([(__CFString *)v5 isEqualToString:@"f.cursive"])
  {

    v5 = @"f.cursive.circle";
  }
  v7 = [MEMORY[0x263F827E8] _systemImageNamed:v5];

  v4 = v3;
LABEL_11:

  return v7;
}

- (id)generateAttributedStringForText:(id)a3 font:(id)a4 color:(id)a5
{
  id v8 = a5;
  v9 = (objc_class *)MEMORY[0x263F089B8];
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v9 alloc] initWithString:v11];

  uint64_t v13 = [v12 length];
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x263F814F0], v10, 0, v13);

  v14 = [(WFMenuItem *)self handler];

  if (v14)
  {
    id v15 = v8;
  }
  else
  {
    id v15 = [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  id v16 = v15;
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x263F81500], v15, 0, v13);

  return v12;
}

- (id)menuElementRepresentationShowingStatus:(BOOL)a3
{
  id v4 = objc_alloc(MEMORY[0x263F089D8]);
  v5 = [(WFMenuItem *)self title];
  uint64_t v6 = (void *)[v4 initWithString:v5];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke;
  v28[3] = &unk_264C50E60;
  v28[4] = self;
  v7 = [MEMORY[0x263F823D0] actionWithTitle:v6 image:0 identifier:0 handler:v28];
  id v8 = [(WFMenuItem *)self subtitle];
  [v7 setSubtitle:v8];

  int64_t v9 = [(WFMenuItem *)self state];
  if (v9 == 2) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = v9 == 1;
  }
  [v7 setState:v10];
  id v11 = [(WFMenuItem *)self handler];

  if (!v11) {
    objc_msgSend(v7, "setAttributes:", objc_msgSend(v7, "attributes") | 1);
  }
  if ([(WFMenuItem *)self isDestructive]) {
    objc_msgSend(v7, "setAttributes:", objc_msgSend(v7, "attributes") | 2);
  }
  v12 = [(WFMenuItem *)self title];
  int v13 = [v12 isEqualToString:&stru_26E88D610];

  if (v13) {
    [v7 setAttributes:4];
  }
  v14 = [(WFMenuItem *)self icon];

  if (v14)
  {
    id v15 = [(WFMenuItem *)self icon];
    id v16 = +[WFMenuItem platformImageForIcon:v15];
    [v7 setImage:v16];
  }
  id v17 = [(WFMenuItem *)self icon];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v18 = v17;
    }
    else {
      id v18 = 0;
    }
  }
  else
  {
    id v18 = 0;
  }
  id v19 = v18;

  uint64_t v20 = [v19 bundleIdentifier];

  if (v20)
  {
    v21 = [v7 image];

    if (!v21)
    {
      uint64_t v22 = (void *)MEMORY[0x263F82658];
      v25[0] = MEMORY[0x263EF8330];
      v25[1] = 3221225472;
      v25[2] = __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_2;
      v25[3] = &unk_264C50ED8;
      id v26 = v20;
      id v27 = v7;
      id v23 = v7;
      v7 = [v22 elementWithProvider:v25];
    }
  }

  return v7;
}

void __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) handler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) handler];
    v3[2]();
  }
}

void __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x263F85258] currentDevice];
  [v4 screenScale];
  double v6 = v5;

  v7 = (void *)MEMORY[0x263F85308];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_3;
  v10[3] = &unk_264C50EB0;
  int64x2_t v13 = vdupq_n_s64(0x404A000000000000uLL);
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = *(id *)(a1 + 40);
  id v12 = v3;
  id v9 = v3;
  [v7 applicationIconImageForBundleIdentifier:v8 length:v10 scale:52.0 completionHandler:v6];
}

void __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_4;
  block[3] = &unk_264C50E88;
  long long v9 = *(_OWORD *)(a1 + 48);
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__WFMenuItem_UIKit__menuElementRepresentationShowingStatus___block_invoke_4(uint64_t a1)
{
  v6[1] = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 40) roundedWithContinuousCornerRadius:*(double *)(a1 + 64) * 0.95 * 0.225 size:*(double *)(a1 + 56)];
  id v3 = [v2 platformImage];
  [*(id *)(a1 + 32) setImage:v3];

  uint64_t v4 = *(void *)(a1 + 48);
  v6[0] = *(void *)(a1 + 32);
  double v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
}

@end