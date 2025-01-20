@interface THNavigationViewController
- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4;
- (BOOL)navigationBar:(id)a3 shouldPushItem:(id)a4;
- (THNavigationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (THNavigationViewController)initWithRootViewController:(id)a3;
- (THNavigationViewController)viewControllerWithNavigationItem:(id)a3;
- (UINavigationBar)navigationBar;
- (UIView)contentContainerView;
- (UIView)footerView;
- (UIViewController)topViewController;
- (id)p_popViewControllerAnimated:(BOOL)a3;
- (id)popToRootViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (id)popToViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)dealloc;
- (void)p_animateFromVC:(id)a3 toVC:(id)a4 transition:(int)a5 completion:(id)a6;
- (void)p_pushViewController:(id)a3 animated:(BOOL)a4;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)releaseViews;
- (void)setContentContainerView:(id)a3;
- (void)setFooterView:(id)a3;
- (void)setNavigationBar:(id)a3;
- (void)viewDidLoad;
@end

@implementation THNavigationViewController

- (THNavigationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6 = THBundle();
  v9.receiver = self;
  v9.super_class = (Class)THNavigationViewController;
  v7 = [(THNavigationViewController *)&v9 initWithNibName:a3 bundle:v6];
  if (v7) {
    v7->mViewControllers = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v7;
}

- (THNavigationViewController)initWithRootViewController:(id)a3
{
  v4 = [(THNavigationViewController *)self initWithNibName:0 bundle:0];
  v5 = v4;
  if (a3 && v4) {
    [(THNavigationViewController *)v4 pushViewController:a3 animated:0];
  }
  return v5;
}

- (void)dealloc
{
  [(THNavigationViewController *)self releaseViews];
  v3.receiver = self;
  v3.super_class = (Class)THNavigationViewController;
  [(THNavigationViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  [(UINavigationBar *)[(THNavigationViewController *)self navigationBar] setItems:0 animated:0];
  [(UINavigationBar *)[(THNavigationViewController *)self navigationBar] setDelegate:self];
  v3.receiver = self;
  v3.super_class = (Class)THNavigationViewController;
  [(THNavigationViewController *)&v3 viewDidLoad];
}

- (void)releaseViews
{
  [(THNavigationViewController *)self setContentContainerView:0];
  [(THNavigationViewController *)self setFooterView:0];

  [(THNavigationViewController *)self setNavigationBar:0];
}

- (UIViewController)topViewController
{
  result = (UIViewController *)[(NSMutableArray *)self->mViewControllers count];
  if (result)
  {
    v4 = (char *)&result[-1].super.super.isa + 7;
    mViewControllers = self->mViewControllers;
    return (UIViewController *)[(NSMutableArray *)mViewControllers objectAtIndex:v4];
  }
  return result;
}

- (void)p_animateFromVC:(id)a3 toVC:(id)a4 transition:(int)a5 completion:(id)a6
{
  if (a3 && !objc_msgSend(objc_msgSend(a3, "view"), "superview")) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationViewController p_animateFromVC:toVC:transition:completion:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationViewController.m") lineNumber:85 description:@"invalid fromVC - %@", a3];
  }
  if (objc_msgSend(objc_msgSend(a4, "view"), "superview")) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THNavigationViewController p_animateFromVC:toVC:transition:completion:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THNavigationViewController.m") lineNumber:86 description:@"expected nil value for '%s'", "toVC.view.superview"];
  }
  [(THNavigationViewController *)self addChildViewController:a4];
  [a3 willMoveToParentViewController:0];
  [(UIView *)[(THNavigationViewController *)self contentContainerView] frame];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(objc_msgSend(a4, "view"), "frame");
  double v21 = v20;
  double v34 = v19;
  if (a5 == 2)
  {
    v61.origin.x = v12;
    v61.origin.y = v14;
    v61.size.width = v16;
    v61.size.height = v18;
    double Width = CGRectGetWidth(v61);
  }
  else
  {
    double Width = v19;
    if (a5 == 1)
    {
      v60.origin.x = v12;
      v60.origin.y = v14;
      v60.size.width = v16;
      v60.size.height = v18;
      double Width = -CGRectGetWidth(v60);
    }
  }
  double v33 = v21;
  objc_msgSend(objc_msgSend(a4, "view"), "setFrame:", Width, v21, v16, v18);
  objc_msgSend(objc_msgSend(a3, "view"), "frame");
  double v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  if (a5 == 2)
  {
    v63.origin.x = v12;
    v63.origin.y = v14;
    v63.size.width = v16;
    v63.size.height = v18;
    double v23 = -CGRectGetWidth(v63);
  }
  else if (a5 == 1)
  {
    v62.origin.x = v12;
    v62.origin.y = v14;
    v62.size.width = v16;
    v62.size.height = v18;
    double v23 = CGRectGetWidth(v62);
  }
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v31 = sub_143BD4;
  v47 = sub_143BD4;
  v48 = &unk_459E40;
  id v49 = a4;
  v50 = self;
  double v52 = v34;
  double v53 = v33;
  double v54 = v16;
  double v55 = v18;
  id v51 = a3;
  double v56 = v23;
  uint64_t v57 = v26;
  uint64_t v58 = v28;
  uint64_t v59 = v30;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v36 = sub_143C88;
  v37 = &unk_459E68;
  double v42 = v24;
  uint64_t v43 = v26;
  uint64_t v44 = v28;
  uint64_t v45 = v30;
  id v38 = a3;
  id v39 = a4;
  v40 = self;
  id v41 = a6;
  if (!a3 || !a4 || !a5) {
    goto LABEL_19;
  }
  id v32 = [a3 parentViewController];
  if (v32 != [a4 parentViewController])
  {
    v31 = v47;
LABEL_19:
    v31((uint64_t)v46);
    ((void (*)(void *, uint64_t))v36)(v35, 1);
    return;
  }
  [(THNavigationViewController *)self transitionFromViewController:a3 toViewController:a4 duration:0 options:v46 animations:v35 completion:0.3];
}

- (void)p_pushViewController:(id)a3 animated:(BOOL)a4
{
  if (a3
    && (BOOL v5 = a4,
        -[NSMutableArray indexOfObjectIdenticalTo:](self->mViewControllers, "indexOfObjectIdenticalTo:") == (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v7 = [(THNavigationViewController *)self topViewController];
    [(NSMutableArray *)self->mViewControllers addObject:a3];
    if ((*(unsigned char *)&self->_flags & 3) == 1) {
      -[UINavigationBar pushNavigationItem:animated:](-[THNavigationViewController navigationBar](self, "navigationBar"), "pushNavigationItem:animated:", [a3 navigationItem], v5);
    }
    if (v5) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 0;
    }
    [(THNavigationViewController *)self p_animateFromVC:v7 toVC:a3 transition:v8 completion:0];
  }
  else
  {
    *(unsigned char *)&self->_flags &= 0xFCu;
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  if (a3)
  {
    if ((*(unsigned char *)&self->_flags & 3) == 0)
    {
      BOOL v5 = a4;
      if (-[NSMutableArray indexOfObjectIdenticalTo:](self->mViewControllers, "indexOfObjectIdenticalTo:") == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFC | 1;
        [(THNavigationViewController *)self p_pushViewController:a3 animated:v5];
      }
    }
  }
}

- (id)p_popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = (char *)[(NSMutableArray *)self->mViewControllers count];
  if (v5)
  {
    uint64_t v6 = v5 - 1;
    id v7 = [(NSMutableArray *)self->mViewControllers objectAtIndex:v5 - 1];
    [(NSMutableArray *)self->mViewControllers removeObjectAtIndex:v6];
    uint64_t v8 = [(THNavigationViewController *)self topViewController];
    if ((*(unsigned char *)&self->_flags & 3) == 1) {
      [(UINavigationBar *)[(THNavigationViewController *)self navigationBar] popNavigationItemAnimated:v3];
    }
    [(THNavigationViewController *)self p_animateFromVC:v7 toVC:v8 transition:v3 completion:0];
  }
  else
  {
    id v7 = 0;
    *(unsigned char *)&self->_flags &= 0xFCu;
  }
  return v7;
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NSMutableArray *)self->mViewControllers count];
  if ((*(unsigned char *)&self->_flags & 3) == 0 && v5 != 0)
  {
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFC | 1;
    [(THNavigationViewController *)self p_popViewControllerAnimated:v3];
  }
  return 0;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  objc_super v9 = (char *)[(NSMutableArray *)self->mViewControllers count];
  v10 = (char *)[(NSMutableArray *)self->mViewControllers indexOfObjectIdenticalTo:a3];
  BOOL v11 = (*(unsigned char *)&self->_flags & 3) != 0 || v10 == (char *)0x7FFFFFFFFFFFFFFFLL;
  CGFloat v12 = v10 + 1;
  if (!v11 && v9 > v12)
  {
    *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFC | 1;
    double v23 = [(THNavigationViewController *)self topViewController];
    double v15 = (char *)(v9 - v12);
    id v14 = -[NSMutableArray subarrayWithRange:](self->mViewControllers, "subarrayWithRange:", v12, v9 - v12);
    -[NSMutableArray removeObjectsInRange:](self->mViewControllers, "removeObjectsInRange:", v12, v15);
    double v16 = +[NSMutableArray arrayWithCapacity:[(NSMutableArray *)self->mViewControllers count]];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    mViewControllers = self->mViewControllers;
    id v18 = [(NSMutableArray *)mViewControllers countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(mViewControllers);
          }
          -[NSMutableArray addObject:](v16, "addObject:", [*(id *)(*((void *)&v24 + 1) + 8 * i) navigationItem]);
        }
        id v19 = [(NSMutableArray *)mViewControllers countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }
    [(UINavigationBar *)[(THNavigationViewController *)self navigationBar] setItems:v16 animated:v6];
    [(THNavigationViewController *)self p_animateFromVC:v23 toVC:a3 transition:v6 completion:a5];
  }
  else
  {
    if (a5) {
      (*((void (**)(id, uint64_t))a5 + 2))(a5, 1);
    }
    return 0;
  }
  return v14;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  if ([(NSMutableArray *)self->mViewControllers count]) {
    id v7 = [(NSMutableArray *)self->mViewControllers objectAtIndex:0];
  }
  else {
    id v7 = 0;
  }

  return [(THNavigationViewController *)self popToViewController:v7 animated:v5 completion:a4];
}

- (THNavigationViewController)viewControllerWithNavigationItem:(id)a3
{
  id v5 = [(NSMutableArray *)self->mViewControllers count];
  if (!v5) {
    return 0;
  }
  id v6 = v5;
  uint64_t v7 = 0;
  while (1)
  {
    uint64_t v8 = (THNavigationViewController *)[(NSMutableArray *)self->mViewControllers objectAtIndex:v7];
    if ([(THNavigationViewController *)v8 navigationItem] == a3) {
      break;
    }
    if (v6 == (id)++v7) {
      return 0;
    }
  }
  return v8;
}

- (BOOL)navigationBar:(id)a3 shouldPushItem:(id)a4
{
  if ((*(unsigned char *)&self->_flags & 3) != 0) {
    return 1;
  }
  id v6 = [(THNavigationViewController *)self viewControllerWithNavigationItem:a4];
  if (!v6) {
    return 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFC | 2;
  BOOL v4 = 1;
  [(THNavigationViewController *)self p_pushViewController:v6 animated:1];
  return v4;
}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  if ((*(unsigned char *)&self->_flags & 3) != 0) {
    return 1;
  }
  if (![(THNavigationViewController *)self viewControllerWithNavigationItem:a4]) {
    return 0;
  }
  *(unsigned char *)&self->_flags = *(unsigned char *)&self->_flags & 0xFC | 2;
  BOOL v4 = 1;
  [(THNavigationViewController *)self p_popViewControllerAnimated:1];
  return v4;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void)setFooterView:(id)a3
{
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
}

- (UINavigationBar)navigationBar
{
  return self->_navigationBar;
}

- (void)setNavigationBar:(id)a3
{
}

@end