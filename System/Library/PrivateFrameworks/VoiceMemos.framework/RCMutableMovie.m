@interface RCMutableMovie
+ (id)movieWithURL:(id)a3 error:(id *)a4;
- (BOOL)rc_writeMovieHeaderWithOptions:(unint64_t)a3 error:(id *)a4;
- (NSURL)linkURL;
- (void)dealloc;
- (void)setLinkURL:(id)a3;
@end

@implementation RCMutableMovie

+ (id)movieWithURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 pathExtension];
  int v8 = [v7 isEqualToString:@"qta"];

  if (v8)
  {
    v9 = [v6 temporaryMovieLink:a4];

    if (v9)
    {
      v10 = [a1 movieWithURL:v9 options:0];
      [v10 setLinkURL:v9];
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = [a1 movieWithURL:v6 options:0];
    v9 = v6;
  }

  return v10;
}

- (void)dealloc
{
  linkURL = self->_linkURL;
  if (linkURL)
  {
    v4 = (void *)MEMORY[0x1E4F28CB8];
    v5 = linkURL;
    id v6 = [v4 defaultManager];
    [v6 removeItemAtURL:v5 error:0];
  }
  v7.receiver = self;
  v7.super_class = (Class)RCMutableMovie;
  [(AVMutableMovie *)&v7 dealloc];
}

- (BOOL)rc_writeMovieHeaderWithOptions:(unint64_t)a3 error:(id *)a4
{
  objc_super v7 = [(AVMutableMovie *)self URL];
  int v8 = [v7 isQuickTime];
  v9 = (id *)MEMORY[0x1E4F15AB0];
  if (!v8) {
    v9 = (id *)MEMORY[0x1E4F15A78];
  }
  id v10 = *v9;

  v11 = [(AVMutableMovie *)self URL];
  BOOL v12 = [(AVMovie *)self writeMovieHeaderToURL:v11 fileType:v10 options:a3 error:a4];

  return v12;
}

- (NSURL)linkURL
{
  return self->_linkURL;
}

- (void)setLinkURL:(id)a3
{
}

- (void).cxx_destruct
{
}

@end