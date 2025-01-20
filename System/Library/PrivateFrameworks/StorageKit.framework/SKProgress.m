@interface SKProgress
+ (SKProgress)progressWithTotalUnitCount:(int64_t)a3;
- (NSMutableArray)children;
- (SKProgress)init;
- (void)chainChildProgress:(id)a3 withPendingUnitCount:(int64_t)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setLocalizedAdditionalDescription:(id)a3;
@end

@implementation SKProgress

- (void)setLocalizedAdditionalDescription:(id)a3
{
  v4 = (void *)MEMORY[0x263F08708];
  id v5 = a3;
  v6 = [v4 newlineCharacterSet];
  v7 = [v5 stringByTrimmingCharactersInSet:v6];

  [(SKProgress *)self setUserInfoObject:v7 forKey:*MEMORY[0x263F08DE8]];
  v8.receiver = self;
  v8.super_class = (Class)SKProgress;
  [(SKProgress *)&v8 setLocalizedAdditionalDescription:v7];
}

+ (SKProgress)progressWithTotalUnitCount:(int64_t)a3
{
  v4 = objc_opt_new();
  [v4 setTotalUnitCount:a3];

  return (SKProgress *)v4;
}

- (SKProgress)init
{
  v7.receiver = self;
  v7.super_class = (Class)SKProgress;
  v2 = [(SKProgress *)&v7 init];
  v3 = v2;
  if (v2)
  {
    [(SKProgress *)v2 set_adoptChildUserInfo:1];
    [(SKProgress *)v3 setLocalizedAdditionalDescription:&stru_26F313B30];
    uint64_t v4 = objc_opt_new();
    children = v3->_children;
    v3->_children = (NSMutableArray *)v4;
  }
  return v3;
}

- (void)chainChildProgress:(id)a3 withPendingUnitCount:(int64_t)a4
{
  id v6 = a3;
  [(SKProgress *)self addChild:v6 withPendingUnitCount:a4];
  objc_super v7 = [(SKProgress *)self children];
  [v7 addObject:v6];

  id v8 = [v6 userInfo];

  [v8 addObserver:self forKeyPath:*MEMORY[0x263F08DE8] options:0 context:0];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7 = *MEMORY[0x263F08DE8];
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x263F08DE8], a4, a5, a6))
  {
    id v9 = [(SKProgress *)self userInfo];
    id v8 = [v9 objectForKeyedSubscript:v7];
    [(SKProgress *)self setLocalizedAdditionalDescription:v8];
  }
}

- (void)dealloc
{
  v3 = [(SKProgress *)self children];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __21__SKProgress_dealloc__block_invoke;
  v5[3] = &unk_26506BBD8;
  v5[4] = self;
  [v3 enumerateObjectsUsingBlock:v5];

  v4.receiver = self;
  v4.super_class = (Class)SKProgress;
  [(SKProgress *)&v4 dealloc];
}

void __21__SKProgress_dealloc__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 userInfo];
  [v3 removeObserver:*(void *)(a1 + 32) forKeyPath:*MEMORY[0x263F08DE8]];
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
}

@end