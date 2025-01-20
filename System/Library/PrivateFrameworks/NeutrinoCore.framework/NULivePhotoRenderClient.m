@interface NULivePhotoRenderClient
- (NULivePhotoRenderClient)initWithName:(id)a3 responseQueue:(id)a4;
- (void)submitGenericRequest:(id)a3 completion:(id)a4;
@end

@implementation NULivePhotoRenderClient

- (void)submitGenericRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v10 = a3;
  v7 = [(NURenderClient *)self responseQueue];
  [v10 setResponseQueue:v7];

  v8 = [(NURenderClient *)self priority];
  [v10 setPriority:v8];

  v9 = [(NURenderClient *)self renderContext];
  [v10 setRenderContext:v9];

  objc_msgSend(v10, "setShouldCoalesceUpdates:", -[NURenderClient shouldCoalesceUpdates](self, "shouldCoalesceUpdates"));
  [v10 submit:v6];
}

- (NULivePhotoRenderClient)initWithName:(id)a3 responseQueue:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)NULivePhotoRenderClient;
  return [(NURenderClient *)&v5 initWithName:a3 responseQueue:a4];
}

@end