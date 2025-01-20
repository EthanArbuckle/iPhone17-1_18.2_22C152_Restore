@interface UIPDFPopupAnnotationView
- (void)dealloc;
- (void)drawRect:(CGRect)a3;
@end

@implementation UIPDFPopupAnnotationView

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIPDFPopupAnnotationView;
  [(UIView *)&v3 dealloc];
}

- (void)drawRect:(CGRect)a3
{
  if ([(UIPDFPageView *)[(UIPDFAnnotationController *)[[(UIPDFAnnotationView *)self annotation] annotationController] pageView] showAnnotations])
  {
    v4 = (void *)[[(UIPDFAnnotationView *)self annotation] parent];
    image = self->_image;
    if (image
      || (v6 = (UIImage *)objc_msgSend((id)objc_msgSend(v4, "annotationController"), "marginNoteImage:", v4),
          self->_image = v6,
          v7 = v6,
          (image = self->_image) != 0))
    {
      [(UIImage *)image size];
      double v9 = v8;
      double v11 = v10;
      [(UIView *)self bounds];
      CGFloat x = v28.origin.x;
      CGFloat y = v28.origin.y;
      CGFloat width = v28.size.width;
      CGFloat height = v28.size.height;
      double v16 = CGRectGetWidth(v28) - v9;
      v29.origin.CGFloat x = x;
      v29.origin.CGFloat y = y;
      v29.size.CGFloat width = width;
      v29.size.CGFloat height = height;
      CGFloat v17 = CGRectGetHeight(v29) - v11;
      v18 = self->_image;
      double v19 = v17 * 0.5;
      -[UIImage drawInRect:](v18, "drawInRect:", v16 * 0.5, v19, v9, v11);
    }
    else
    {
      ContextStack = GetContextStack(0);
      if (*(int *)ContextStack < 1) {
        v21 = 0;
      }
      else {
        v21 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
      }
      v22 = (CGColor *)[v4 color];
      CGContextSaveGState(v21);
      CGContextSetFillColorWithColor(v21, v22);
      [(UIView *)self bounds];
      CGContextFillRect(v21, v30);
      CGContextSetStrokeColorWithColor(v21, [+[UIColor blackColor] CGColor]);
      [(UIView *)self bounds];
      CGRect v32 = CGRectInset(v31, 2.0, 2.0);
      CGFloat v23 = v32.origin.x;
      CGFloat v24 = v32.origin.y;
      CGFloat v25 = v32.size.width;
      CGFloat v26 = v32.size.height;
      CGContextSetLineWidth(v21, 1.0);
      v33.origin.CGFloat x = v23;
      v33.origin.CGFloat y = v24;
      v33.size.CGFloat width = v25;
      v33.size.CGFloat height = v26;
      CGContextStrokeRect(v21, v33);
      CGContextRestoreGState(v21);
    }
  }
}

@end