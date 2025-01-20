@interface QSSMutableRecognitionResult
- (NSArray)choice_alignments;
- (NSArray)post_itn_nbest_choices;
- (NSArray)pre_itn_nbest_choices;
- (NSArray)pre_itn_token_to_post_itn_char_alignment;
- (QSSMutableRecognitionResult)init;
- (QSSRecognitionSausage)post_itn;
- (QSSRecognitionSausage)pre_itn;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setChoice_alignments:(id)a3;
- (void)setPost_itn:(id)a3;
- (void)setPost_itn_nbest_choices:(id)a3;
- (void)setPre_itn:(id)a3;
- (void)setPre_itn_nbest_choices:(id)a3;
- (void)setPre_itn_token_to_post_itn_char_alignment:(id)a3;
@end

@implementation QSSMutableRecognitionResult

- (void)setChoice_alignments:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)choice_alignments
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"choice_alignments"];
}

- (void)setPre_itn_token_to_post_itn_char_alignment:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)pre_itn_token_to_post_itn_char_alignment
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pre_itn_token_to_post_itn_char_alignment"];
}

- (void)setPost_itn_nbest_choices:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)post_itn_nbest_choices
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"post_itn_nbest_choices"];
}

- (void)setPre_itn_nbest_choices:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (NSArray)pre_itn_nbest_choices
{
  return (NSArray *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pre_itn_nbest_choices"];
}

- (void)setPost_itn:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSRecognitionSausage)post_itn
{
  return (QSSRecognitionSausage *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"post_itn"];
}

- (void)setPre_itn:(id)a3
{
  id v4 = (id)[a3 copy];
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._storage, "setObject:forKeyedSubscript:");
}

- (QSSRecognitionSausage)pre_itn
{
  return (QSSRecognitionSausage *)[(NSMutableDictionary *)self->super._storage objectForKeyedSubscript:@"pre_itn"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(NSMutableDictionary *)self->super._storage copy];
  v6 = (void *)v4[1];
  v4[1] = v5;

  return v4;
}

- (QSSMutableRecognitionResult)init
{
  v6.receiver = self;
  v6.super_class = (Class)QSSMutableRecognitionResult;
  v2 = [(QSSMutableRecognitionResult *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    storage = v2->super._storage;
    v2->super._storage = (NSMutableDictionary *)v3;
  }
  return v2;
}

@end