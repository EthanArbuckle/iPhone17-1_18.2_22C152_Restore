@interface DebugFramesView
- (DebugFramesView)initWithFrame:(CGRect)a3;
- (void)didMoveToSuperview;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)registerName:(id)a3 color:(id)a4 weight:(double)a5 edges:(unint64_t)a6;
- (void)setFrame:(CGRect)a3 forName:(id)a4;
- (void)setLayoutGuide:(id)a3 forName:(id)a4;
- (void)unregisterAll;
- (void)unregisterName:(id)a3;
@end

@implementation DebugFramesView

- (DebugFramesView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)DebugFramesView;
  v3 = -[DebugFramesView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[NSMutableOrderedSet orderedSet];
    names = v3->_names;
    v3->_names = (NSMutableOrderedSet *)v4;

    uint64_t v6 = +[NSMutableDictionary dictionary];
    framesByName = v3->_framesByName;
    v3->_framesByName = (NSMutableDictionary *)v6;

    v8 = +[UIColor clearColor];
    [(DebugFramesView *)v3 setBackgroundColor:v8];

    [(DebugFramesView *)v3 setUserInteractionEnabled:0];
    [(DebugFramesView *)v3 setContentMode:3];
  }
  return v3;
}

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)DebugFramesView;
  [(DebugFramesView *)&v4 didMoveToSuperview];
  v3 = [(DebugFramesView *)self superview];
  [v3 bringSubviewToFront:self];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)DebugFramesView;
  [(DebugFramesView *)&v4 layoutSubviews];
  v3 = [(DebugFramesView *)self superview];
  [v3 bringSubviewToFront:self];
}

- (void)registerName:(id)a3 color:(id)a4 weight:(double)a5 edges:(unint64_t)a6
{
  id v12 = a3;
  id v10 = a4;
  if (v12)
  {
    v11 = [(NSMutableDictionary *)self->_framesByName objectForKeyedSubscript:v12];
    if (!v11)
    {
      v11 = objc_alloc_init(DebugFrameConfig);
      [(NSMutableDictionary *)self->_framesByName setObject:v11 forKeyedSubscript:v12];
    }
    [(DebugFrameConfig *)v11 setColor:v10];
    [(DebugFrameConfig *)v11 setWeight:a5];
    [(DebugFrameConfig *)v11 setEdges:a6];
    [(NSMutableOrderedSet *)self->_names addObject:v12];
  }
}

- (void)unregisterName:(id)a3
{
  if (a3)
  {
    names = self->_names;
    id v5 = a3;
    [(NSMutableOrderedSet *)names removeObject:v5];
    [(NSMutableDictionary *)self->_framesByName removeObjectForKey:v5];
  }
}

- (void)unregisterAll
{
  [(NSMutableOrderedSet *)self->_names removeAllObjects];
  framesByName = self->_framesByName;

  [(NSMutableDictionary *)framesByName removeAllObjects];
}

- (void)setFrame:(CGRect)a3 forName:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = [(NSMutableDictionary *)self->_framesByName objectForKeyedSubscript:a4];
  id v10 = v9;
  if (v9)
  {
    id v12 = v9;
    [v9 frame];
    v15.origin.double x = x;
    v15.origin.double y = y;
    v15.size.double width = width;
    v15.size.double height = height;
    BOOL v11 = CGRectEqualToRect(v14, v15);
    id v10 = v12;
    if (!v11)
    {
      [v12 setFrame:CGRectMake(x, y, width, height)];
      [(DebugFramesView *)self setNeedsDisplay];
      id v10 = v12;
    }
  }
}

- (void)setLayoutGuide:(id)a3 forName:(id)a4
{
  id v9 = a3;
  uint64_t v6 = [(NSMutableDictionary *)self->_framesByName objectForKeyedSubscript:a4];
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 layoutGuide];

    if (v8 != v9)
    {
      [v7 setLayoutGuide:v9];
      [(DebugFramesView *)self setNeedsDisplay];
    }
  }
}

- (void)drawRect:(CGRect)a3
{
  v106.receiver = self;
  v106.super_class = (Class)DebugFramesView;
  -[DebugFramesView drawRect:](&v106, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = [(DebugFramesView *)self traitCollection];
  id v6 = [v5 userInterfaceIdiom];

  double v7 = 5.0;
  if (v6 == (id)5) {
    double v7 = 10.0;
  }
  id v8 = +[UIFont boldSystemFontOfSize:v7];
  id v9 = [(NSMutableOrderedSet *)self->_names count];
  uint64_t v94 = (uint64_t)&v94;
  __chkstk_darwin(v9);
  BOOL v11 = &v94 - 2 * v10;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  v101 = self;
  v97 = self->_names;
  id v99 = [(NSMutableOrderedSet *)v97 countByEnumeratingWithState:&v102 objects:v109 count:16];
  if (v99)
  {
    uint64_t v12 = 0;
    uint64_t v98 = *(void *)v103;
    NSAttributedStringKey v96 = NSFontAttributeName;
    NSAttributedStringKey v95 = NSForegroundColorAttributeName;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v103 != v98) {
          objc_enumerationMutation(v97);
        }
        uint64_t v14 = v12;
        framesByName = v101->_framesByName;
        v100 = *(void **)(*((void *)&v102 + 1) + 8 * (void)v13);
        v16 = -[NSMutableDictionary objectForKeyedSubscript:](framesByName, "objectForKeyedSubscript:");
        v17 = [v16 color];
        if (!v17)
        {
          v17 = +[UIColor grayColor];
        }
        v18 = v11;
        id v19 = v17;
        CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v19 CGColor]);
        id v20 = v19;
        CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v20 CGColor]);
        [v16 weight];
        double v21 = 1.0;
        if (v22 >= 1.0)
        {
          [v16 weight];
          double v21 = v23;
        }
        CGContextSetLineWidth(CurrentContext, v21);
        [v16 frame];
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;
        v32 = [v16 layoutGuide];

        if (v32)
        {
          v33 = [v16 layoutGuide];
          [v33 layoutFrame];
          double v35 = v34;
          double v37 = v36;
          double v39 = v38;
          double v41 = v40;

          v42 = [v16 layoutGuide];
          v43 = [v42 owningView];
          -[DebugFramesView convertRect:fromView:](v101, "convertRect:fromView:", v43, v35, v37, v39, v41);
          double v25 = v44;
          double v27 = v45;
          double v29 = v46;
          double v31 = v47;
        }
        BOOL v11 = v18;
        double v48 = v21 * 0.5;
        uint64_t v12 = v14;
        switch((unint64_t)[v16 edges])
        {
          case 1uLL:
            CGFloat v49 = v48 + v25;
            CGFloat v50 = v29 - v21;
            v110.origin.double x = v49;
            v110.origin.double y = v27;
            v110.size.double width = v50;
            v110.size.double height = v31;
            CGFloat MinX = CGRectGetMinX(v110);
            v111.origin.double x = v49;
            v111.origin.double y = v27;
            v111.size.double width = v50;
            v111.size.double height = v31;
            CGFloat MinY = CGRectGetMinY(v111);
            CGContextMoveToPoint(CurrentContext, MinX, MinY);
            v112.origin.double x = v49;
            v112.origin.double y = v27;
            v112.size.double width = v50;
            v112.size.double height = v31;
            CGFloat v53 = CGRectGetMinX(v112);
            v113.origin.double x = v49;
            v113.origin.double y = v27;
            v113.size.double width = v50;
            v113.size.double height = v31;
            CGFloat v54 = CGRectGetMinY(v113);
            CGContextAddLineToPoint(CurrentContext, v53, v54 + 10.0);
            v114.origin.double x = v49;
            v114.origin.double y = v27;
            v114.size.double width = v50;
            v114.size.double height = v31;
            CGFloat MaxX = CGRectGetMaxX(v114);
            v115.origin.double x = v49;
            v115.origin.double y = v27;
            v115.size.double width = v50;
            v115.size.double height = v31;
            CGFloat v56 = CGRectGetMinY(v115);
            CGContextMoveToPoint(CurrentContext, MaxX, v56);
            v116.origin.double x = v49;
            v116.origin.double y = v27;
            v116.size.double width = v50;
            v116.size.double height = v31;
            double v57 = CGRectGetMaxX(v116);
            v117.origin.double x = v49;
            v117.origin.double y = v27;
            v117.size.double width = v50;
            v117.size.double height = v31;
            double v58 = CGRectGetMinY(v117) + 10.0;
            goto LABEL_20;
          case 2uLL:
            double v67 = v48 + v27;
            double v68 = v31 - v21;
            v126.origin.double x = v25;
            v126.origin.double y = v67;
            v126.size.double width = v29;
            v126.size.double height = v68;
            CGFloat v69 = CGRectGetMinX(v126);
            v127.origin.double x = v25;
            v127.origin.double y = v67;
            v127.size.double width = v29;
            v127.size.double height = v68;
            CGFloat v70 = CGRectGetMinY(v127);
            CGContextMoveToPoint(CurrentContext, v69, v70);
            v128.origin.double x = v25;
            v128.origin.double y = v67;
            v128.size.double width = v29;
            v128.size.double height = v68;
            CGFloat v71 = CGRectGetMinX(v128) + 10.0;
            v129.origin.double x = v25;
            v129.origin.double y = v67;
            v129.size.double width = v29;
            v129.size.double height = v68;
            CGFloat v72 = CGRectGetMinY(v129);
            CGContextAddLineToPoint(CurrentContext, v71, v72);
            v130.origin.double x = v25;
            v130.origin.double y = v67;
            v130.size.double width = v29;
            v130.size.double height = v68;
            CGFloat v73 = CGRectGetMinX(v130);
            v131.origin.double x = v25;
            v131.origin.double y = v67;
            v131.size.double width = v29;
            v131.size.double height = v68;
            CGFloat MaxY = CGRectGetMaxY(v131);
            CGContextMoveToPoint(CurrentContext, v73, MaxY);
            v132.origin.double x = v25;
            v132.origin.double y = v67;
            v132.size.double width = v29;
            v132.size.double height = v68;
            double v57 = CGRectGetMinX(v132) + 10.0;
            goto LABEL_19;
          case 4uLL:
            CGFloat v59 = v48 + v25;
            CGFloat v60 = v29 - v21;
            v118.origin.double x = v59;
            v118.origin.double y = v27;
            v118.size.double width = v60;
            v118.size.double height = v31;
            CGFloat v61 = CGRectGetMinX(v118);
            v119.origin.double x = v59;
            v119.origin.double y = v27;
            v119.size.double width = v60;
            v119.size.double height = v31;
            CGFloat v62 = CGRectGetMaxY(v119);
            CGContextMoveToPoint(CurrentContext, v61, v62);
            v120.origin.double x = v59;
            v120.origin.double y = v27;
            v120.size.double width = v60;
            v120.size.double height = v31;
            CGFloat v63 = CGRectGetMinX(v120);
            v121.origin.double x = v59;
            v121.origin.double y = v27;
            v121.size.double width = v60;
            v121.size.double height = v31;
            CGFloat v64 = CGRectGetMaxY(v121);
            CGContextAddLineToPoint(CurrentContext, v63, v64 + -10.0);
            v122.origin.double x = v59;
            v122.origin.double y = v27;
            v122.size.double width = v60;
            v122.size.double height = v31;
            CGFloat v65 = CGRectGetMaxX(v122);
            v123.origin.double x = v59;
            v123.origin.double y = v27;
            v123.size.double width = v60;
            v123.size.double height = v31;
            CGFloat v66 = CGRectGetMaxY(v123);
            CGContextMoveToPoint(CurrentContext, v65, v66);
            v124.origin.double x = v59;
            v124.origin.double y = v27;
            v124.size.double width = v60;
            v124.size.double height = v31;
            double v57 = CGRectGetMaxX(v124);
            v125.origin.double x = v59;
            v125.origin.double y = v27;
            v125.size.double width = v60;
            v125.size.double height = v31;
            double v58 = CGRectGetMaxY(v125) + -10.0;
            goto LABEL_20;
          case 8uLL:
            double v67 = v48 + v27;
            double v68 = v31 - v21;
            v133.origin.double x = v25;
            v133.origin.double y = v67;
            v133.size.double width = v29;
            v133.size.double height = v68;
            CGFloat v75 = CGRectGetMaxX(v133);
            v134.origin.double x = v25;
            v134.origin.double y = v67;
            v134.size.double width = v29;
            v134.size.double height = v68;
            CGFloat v76 = CGRectGetMinY(v134);
            CGContextMoveToPoint(CurrentContext, v75, v76);
            v135.origin.double x = v25;
            v135.origin.double y = v67;
            v135.size.double width = v29;
            v135.size.double height = v68;
            CGFloat v77 = CGRectGetMaxX(v135) + -10.0;
            v136.origin.double x = v25;
            v136.origin.double y = v67;
            v136.size.double width = v29;
            v136.size.double height = v68;
            CGFloat v78 = CGRectGetMinY(v136);
            CGContextAddLineToPoint(CurrentContext, v77, v78);
            v137.origin.double x = v25;
            v137.origin.double y = v67;
            v137.size.double width = v29;
            v137.size.double height = v68;
            CGFloat v79 = CGRectGetMaxX(v137);
            v138.origin.double x = v25;
            v138.origin.double y = v67;
            v138.size.double width = v29;
            v138.size.double height = v68;
            CGFloat v80 = CGRectGetMaxY(v138);
            CGContextMoveToPoint(CurrentContext, v79, v80);
            v139.origin.double x = v25;
            v139.origin.double y = v67;
            v139.size.double width = v29;
            v139.size.double height = v68;
            double v57 = CGRectGetMaxX(v139) + -10.0;
LABEL_19:
            v140.origin.double x = v25;
            v140.origin.double y = v67;
            v140.size.double width = v29;
            v140.size.double height = v68;
            double v58 = CGRectGetMaxY(v140);
LABEL_20:
            CGContextAddLineToPoint(CurrentContext, v57, v58);
            CGContextStrokePath(CurrentContext);
            break;
          default:
            CGFloat v81 = v48 + v25;
            CGFloat v82 = v48 + v27;
            v141.size.double width = v29 - v21;
            v141.size.double height = v31 - v21;
            v141.origin.double x = v81;
            v141.origin.double y = v82;
            CGContextAddRect(CurrentContext, v141);
            CGContextStrokePath(CurrentContext);
            double v83 = v81 + 2.0;
            double v84 = v82 + 1.0;
            if (v14)
            {
              uint64_t v85 = 0;
              v86 = v100;
              do
              {
                v87 = (double *)&v11[2 * v85];
                double v88 = v87[1];
                if (v83 == *v87 && v84 == v88)
                {
                  do
                  {
                    [v8 lineHeight];
                    double v84 = v84 + v90;
                  }
                  while (v84 == v88);
                }
                ++v85;
              }
              while (v85 != v12);
            }
            else
            {
              v86 = v100;
            }
            v107[0] = v96;
            v107[1] = v95;
            v108[0] = v8;
            v108[1] = v20;
            v91 = +[NSDictionary dictionaryWithObjects:v108 forKeys:v107 count:2];
            [v86 drawAtPoint:v91 withAttributes:v83, v84];

            v92 = (double *)&v11[2 * v12];
            double *v92 = v83;
            v92[1] = v84;
            ++v12;
            break;
        }

        v13 = (char *)v13 + 1;
      }
      while (v13 != v99);
      id v93 = [(NSMutableOrderedSet *)v97 countByEnumeratingWithState:&v102 objects:v109 count:16];
      id v99 = v93;
    }
    while (v93);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_framesByName, 0);

  objc_storeStrong((id *)&self->_names, 0);
}

@end