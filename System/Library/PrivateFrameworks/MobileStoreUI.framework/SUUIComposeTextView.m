@interface SUUIComposeTextView
- (void)setPlaceholder:(id)a3;
@end

@implementation SUUIComposeTextView

- (void)setPlaceholder:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v9 = *MEMORY[0x263F81500];
  v4 = (void *)MEMORY[0x263F825C8];
  id v5 = a3;
  v6 = [v4 placeholderTextColor];
  v10[0] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v7];
  [(SUUIComposeTextView *)self setAttributedPlaceholder:v8];
}

@end