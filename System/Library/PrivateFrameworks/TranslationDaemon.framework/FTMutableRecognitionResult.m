@interface FTMutableRecognitionResult
- (FTMutableRecognitionResult)init;
- (FTRecognitionSausage)post_itn;
- (FTRecognitionSausage)pre_itn;
- (NSArray)choice_alignments;
- (NSArray)post_itn_nbest_choices;
- (NSArray)pre_itn_nbest_choices;
- (NSArray)pre_itn_token_to_post_itn_char_alignment;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setChoice_alignments:(id)a3;
- (void)setPost_itn:(id)a3;
- (void)setPost_itn_nbest_choices:(id)a3;
- (void)setPre_itn:(id)a3;
- (void)setPre_itn_nbest_choices:(id)a3;
- (void)setPre_itn_token_to_post_itn_char_alignment:(id)a3;
@end

@implementation FTMutableRecognitionResult

- (FTMutableRecognitionResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTMutableRecognitionResult;
  v2 = [(FTMutableRecognitionResult *)&v6 init];
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

- (FTRecognitionSausage)pre_itn
{
  return (FTRecognitionSausage *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pre_itn"];
}

- (void)setPre_itn:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (FTRecognitionSausage)post_itn
{
  return (FTRecognitionSausage *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"post_itn"];
}

- (void)setPost_itn:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)pre_itn_nbest_choices
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pre_itn_nbest_choices"];
}

- (void)setPre_itn_nbest_choices:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)post_itn_nbest_choices
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"post_itn_nbest_choices"];
}

- (void)setPost_itn_nbest_choices:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)pre_itn_token_to_post_itn_char_alignment
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignment"];
}

- (void)setPre_itn_token_to_post_itn_char_alignment:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)choice_alignments
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"choice_alignments"];
}

- (void)setChoice_alignments:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

@end