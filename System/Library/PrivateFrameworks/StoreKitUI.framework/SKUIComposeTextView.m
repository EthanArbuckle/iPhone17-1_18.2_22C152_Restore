@interface SKUIComposeTextView
- (void)setPlaceholder:(id)a3;
@end

@implementation SKUIComposeTextView

- (void)setPlaceholder:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v9 = *MEMORY[0x1E4FB0700];
  v4 = (void *)MEMORY[0x1E4FB1618];
  id v5 = a3;
  v6 = [v4 placeholderTextColor];
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5 attributes:v7];
  [(SKUIComposeTextView *)self setAttributedPlaceholder:v8];
}

@end