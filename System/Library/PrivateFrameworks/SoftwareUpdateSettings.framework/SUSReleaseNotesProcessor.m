@interface SUSReleaseNotesProcessor
+ (id)sharedInstance;
- (id)normalizeHtmlReleaseNotes:(id)a3;
- (id)normalizeHtmlReleaseNotes:(id)a3 withAdditionalCSS:(id)a4;
@end

@implementation SUSReleaseNotesProcessor

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&sharedInstance_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global_1);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __42__SUSReleaseNotesProcessor_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SUSReleaseNotesProcessor);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

- (id)normalizeHtmlReleaseNotes:(id)a3
{
  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = [(SUSReleaseNotesProcessor *)v6 normalizeHtmlReleaseNotes:location[0] withAdditionalCSS:@":root {   color-scheme: light dark;}p {   -webkit-text-size-adjust: 100% !important;   font-family: -apple-system, system-ui, HelveticaNeue, LucidaGrande !important;   color: -apple-system-label !important;}"];
  objc_storeStrong(location, 0);
  return v4;
}

- (id)normalizeHtmlReleaseNotes:(id)a3 withAdditionalCSS:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v42 = 0;
  objc_storeStrong(&v42, a4);
  id v41 = (id)[MEMORY[0x263F08AE8] regularExpressionWithPattern:@"<style[^>]*>" options:1 error:0];
  id v19 = location[0];
  uint64_t v4 = [location[0] length];
  uint64_t v62 = 0;
  uint64_t v61 = v4;
  uint64_t v63 = 0;
  uint64_t v64 = v4;
  uint64_t v38 = 0;
  uint64_t v39 = v4;
  id v40 = (id)objc_msgSend(v41, "firstMatchInString:options:range:", v19, 0, 0, v4);
  if (v40)
  {
    uint64_t v34 = [v40 range];
    uint64_t v35 = v5;
    uint64_t v32 = [v40 range];
    uint64_t v33 = v6;
    uint64_t v17 = v34 + v6;
    uint64_t v16 = [location[0] length];
    uint64_t v30 = [v40 range];
    uint64_t v31 = v7;
    v29[1] = (id)[v40 range];
    v29[2] = v8;
    uint64_t v58 = v17;
    uint64_t v57 = v16 - v30 - (void)v8;
    uint64_t v59 = v17;
    uint64_t v60 = v57;
    uint64_t v36 = v17;
    uint64_t v37 = v57;
    v29[0] = (id)objc_msgSend(location[0], "substringWithRange:", v17, v57);
    id v28 = (id)[MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\/\\*\\s*apple-ota-disable-default-css\\s*\\*\\/" options:1 error:0];
    v9 = (void *)[v29[0] length];
    uint64_t v54 = 0;
    v53 = v9;
    uint64_t v55 = 0;
    v56 = v9;
    v25[1] = 0;
    v25[2] = v9;
    uint64_t v26 = objc_msgSend(v28, "rangeOfFirstMatchInString:options:range:", v29[0], 0, 0, v9);
    uint64_t v27 = v10;
    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v25[0] = (id)[NSString stringWithFormat:@"%@\n%@", v42, v29[0]];
      id v44 = (id)objc_msgSend(location[0], "stringByReplacingCharactersInRange:withString:", v36, v37, v25[0]);
      int v24 = 1;
      objc_storeStrong(v25, 0);
    }
    else
    {
      id v44 = location[0];
      int v24 = 1;
    }
    objc_storeStrong(&v28, 0);
    objc_storeStrong(v29, 0);
  }
  else
  {
    id v23 = (id)[NSString stringWithFormat:@"<style>%@</style>", v42];
    id v22 = (id)[MEMORY[0x263F08AE8] regularExpressionWithPattern:@"<html[^>]*>" options:1 error:0];
    id v15 = location[0];
    uint64_t v11 = [location[0] length];
    uint64_t v50 = 0;
    uint64_t v49 = v11;
    uint64_t v51 = 0;
    uint64_t v52 = v11;
    id v21 = (id)objc_msgSend(v22, "firstMatchInString:options:range:", v15, 0, 0, v11);
    if (v21)
    {
      uint64_t v20 = [v21 range];
      [v21 range];
      uint64_t v46 = v20 + v12;
      uint64_t v45 = 0;
      uint64_t v48 = 0;
      uint64_t v47 = v20 + v12;
      id v44 = (id)objc_msgSend(location[0], "stringByReplacingCharactersInRange:withString:", v20 + v12, 0, v23);
    }
    else
    {
      id v44 = (id)[NSString stringWithFormat:@"%@\n%@", location[0], v23];
    }
    int v24 = 1;
    objc_storeStrong(&v21, 0);
    objc_storeStrong(&v22, 0);
    objc_storeStrong(&v23, 0);
  }
  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(location, 0);
  v13 = v44;
  return v13;
}

@end