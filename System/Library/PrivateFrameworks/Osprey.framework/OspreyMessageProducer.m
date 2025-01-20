@interface OspreyMessageProducer
- (OspreyMessageProducer)initWithMessageSerializer:(id)a3 streamingContext:(id)a4;
- (void)finishProducing;
- (void)produceMessage:(id)a3;
- (void)produceMessage:(id)a3 compressed:(BOOL)a4;
@end

@implementation OspreyMessageProducer

- (OspreyMessageProducer)initWithMessageSerializer:(id)a3 streamingContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OspreyMessageProducer;
  v8 = [(OspreyMessageProducer *)&v12 init];
  if (v8)
  {
    uint64_t v9 = MEMORY[0x1C189D2A0](v6);
    id serializer = v8->_serializer;
    v8->_id serializer = (id)v9;

    objc_storeStrong((id *)&v8->_streamingContext, a4);
  }

  return v8;
}

- (void)produceMessage:(id)a3
{
  (*((void (**)(void))self->_serializer + 2))();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(OspreyClientStreamingContext *)self->_streamingContext writeFrame:v4];
}

- (void)produceMessage:(id)a3 compressed:(BOOL)a4
{
  BOOL v4 = a4;
  (*((void (**)(void))self->_serializer + 2))();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [(OspreyClientStreamingContext *)self->_streamingContext writeFrame:v6 compressed:v4];
}

- (void)finishProducing
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamingContext, 0);

  objc_storeStrong(&self->_serializer, 0);
}

@end