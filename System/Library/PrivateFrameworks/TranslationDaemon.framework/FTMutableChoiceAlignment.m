@interface FTMutableChoiceAlignment
- (FTMutableChoiceAlignment)init;
- (NSArray)post_itn_choice_indices;
- (NSArray)pre_itn_token_to_post_itn_char_alignments;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPost_itn_choice_indices:(id)a3;
- (void)setPre_itn_token_to_post_itn_char_alignments:(id)a3;
@end

@implementation FTMutableChoiceAlignment

- (FTMutableChoiceAlignment)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableChoiceAlignment;
  v2 = [(FTMutableChoiceAlignment *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  objc_super v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (NSArray)post_itn_choice_indices
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"post_itn_choice_indices"];
}

- (void)setPost_itn_choice_indices:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)pre_itn_token_to_post_itn_char_alignments
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignments"];
}

- (void)setPre_itn_token_to_post_itn_char_alignments:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end