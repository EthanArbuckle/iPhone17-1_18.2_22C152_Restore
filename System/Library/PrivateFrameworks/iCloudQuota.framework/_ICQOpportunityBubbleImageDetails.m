@interface _ICQOpportunityBubbleImageDetails
- (NSString)urlFor1x;
- (NSString)urlFor2x;
- (NSString)urlFor3x;
- (_ICQOpportunityBubbleImageDetails)initWithServerDictionary:(id)a3;
- (id)getURLForScale:(int64_t)a3;
- (void)setUrlFor1x:(id)a3;
- (void)setUrlFor2x:(id)a3;
- (void)setUrlFor3x:(id)a3;
@end

@implementation _ICQOpportunityBubbleImageDetails

- (_ICQOpportunityBubbleImageDetails)initWithServerDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_ICQOpportunityBubbleImageDetails;
  v5 = [(_ICQOpportunityBubbleImageDetails *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"3x"];
    [(_ICQOpportunityBubbleImageDetails *)v5 setUrlFor3x:v6];

    v7 = [v4 objectForKeyedSubscript:@"2x"];
    [(_ICQOpportunityBubbleImageDetails *)v5 setUrlFor2x:v7];

    v8 = [v4 objectForKeyedSubscript:@"1x"];
    [(_ICQOpportunityBubbleImageDetails *)v5 setUrlFor1x:v8];
  }
  return v5;
}

- (id)getURLForScale:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 3:
      uint64_t v4 = [(_ICQOpportunityBubbleImageDetails *)self urlFor3x];
      goto LABEL_7;
    case 2:
      uint64_t v4 = [(_ICQOpportunityBubbleImageDetails *)self urlFor2x];
      goto LABEL_7;
    case 1:
      uint64_t v4 = [(_ICQOpportunityBubbleImageDetails *)self urlFor1x];
LABEL_7:
      v5 = v4;
      v6 = [MEMORY[0x1E4F1CB10] URLWithString:v4];
      goto LABEL_11;
  }
  v5 = _ICQGetLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    int64_t v9 = a3;
    _os_log_impl(&dword_1D5851000, v5, OS_LOG_TYPE_DEFAULT, "Invalid scale %ld", (uint8_t *)&v8, 0xCu);
  }
  v6 = 0;
LABEL_11:

  return v6;
}

- (NSString)urlFor3x
{
  return self->_urlFor3x;
}

- (void)setUrlFor3x:(id)a3
{
}

- (NSString)urlFor2x
{
  return self->_urlFor2x;
}

- (void)setUrlFor2x:(id)a3
{
}

- (NSString)urlFor1x
{
  return self->_urlFor1x;
}

- (void)setUrlFor1x:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlFor1x, 0);
  objc_storeStrong((id *)&self->_urlFor2x, 0);
  objc_storeStrong((id *)&self->_urlFor3x, 0);
}

@end