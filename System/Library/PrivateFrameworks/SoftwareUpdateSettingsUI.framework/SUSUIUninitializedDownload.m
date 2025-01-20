@interface SUSUIUninitializedDownload
- (SUSUIUninitializedDownload)init;
- (SUSUIUninitializedDownload)initWithDescriptor:(id)a3;
@end

@implementation SUSUIUninitializedDownload

- (SUSUIUninitializedDownload)init
{
}

- (SUSUIUninitializedDownload)initWithDescriptor:(id)a3
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v13;
  v13 = 0;
  v11.receiver = v3;
  v11.super_class = (Class)SUSUIUninitializedDownload;
  v9 = [(SUDownload *)&v11 init];
  v13 = v9;
  objc_storeStrong((id *)&v13, v9);
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F78210]);
    [v10 setIsDone:0];
    [v10 setPhase:*MEMORY[0x263F78420]];
    [(SUDownload *)v13 setProgress:v10];
    [(SUDownload *)v13 setDescriptor:location[0]];
    v7 = v13;
    id v4 = objc_alloc(MEMORY[0x263F781E0]);
    id v8 = (id)[v4 initWithDescriptor:location[0]];
    -[SUDownload setDownloadOptions:](v7, "setDownloadOptions:");

    objc_storeStrong(&v10, 0);
  }
  v6 = v13;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v6;
}

@end