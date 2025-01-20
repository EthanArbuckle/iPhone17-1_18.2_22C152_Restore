@interface CRLiOSPreventScrollGestureRecognizer
- (CRLiOSPreventScrollGestureRecognizer)initWithInteractiveCanvasController:(id)a3;
- (id)p_ICC;
- (void)reset;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation CRLiOSPreventScrollGestureRecognizer

- (CRLiOSPreventScrollGestureRecognizer)initWithInteractiveCanvasController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLiOSPreventScrollGestureRecognizer;
  v5 = [(CRLiOSPreventScrollGestureRecognizer *)&v12 initWithTarget:0 action:0];
  if (v5)
  {
    if (!v4)
    {
      int v6 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EC3E0);
      }
      v7 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109C1C4(v6, v7);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EC400);
      }
      v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101066770(v8, v6);
      }
      v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLiOSPreventScrollGestureRecognizer initWithInteractiveCanvasController:]");
      v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLiOSPreventScrollGestureRecognizer.m"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v9, v10, 29, 0, "invalid nil value for '%{public}s'", "icc");
    }
    objc_storeWeak((id *)&v5->_interactiveCanvasController, v4);
  }

  return v5;
}

- (void)reset
{
  touch = self->_touch;
  self->_touch = 0;

  secondTouch = self->_secondTouch;
  self->_secondTouch = 0;

  v5.receiver = self;
  v5.super_class = (Class)CRLiOSPreventScrollGestureRecognizer;
  [(CRLiOSPreventScrollGestureRecognizer *)&v5 reset];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CRLiOSPreventScrollGestureRecognizer;
  [(CRLiOSPreventScrollGestureRecognizer *)&v31 touchesBegan:v6 withEvent:a4];
  v7 = [(CRLiOSPreventScrollGestureRecognizer *)self p_ICC];
  v8 = [v7 layerHost];
  v9 = [v8 asUIKitHost];

  if ([(CRLiOSPreventScrollGestureRecognizer *)self state]
    || ![v7 currentlyScrolling])
  {
    v10 = [v7 canvasView];
    v11 = [v10 enclosingScrollView];
    objc_super v12 = [v11 panGestureRecognizer];
    id v13 = [v12 minimumNumberOfTouches];

    if ((unint64_t)v13 < 2)
    {
      v25 = v7;
      id v26 = v6;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v14 = v6;
      id v15 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (!v15) {
        goto LABEL_21;
      }
      id v16 = v15;
      uint64_t v17 = *(void *)v28;
      while (1)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if (![(CRLiOSPreventScrollGestureRecognizer *)self state])
          {
            p_touch = &self->_touch;
            if (self->_touch)
            {
              objc_storeStrong((id *)&self->_secondTouch, v19);
              v21 = self;
              uint64_t v22 = 1;
LABEL_18:
              [(CRLiOSPreventScrollGestureRecognizer *)v21 setState:v22];
              continue;
            }
            objc_storeStrong((id *)&self->_touch, v19);
            if ((id)[(UITouch *)*p_touch tapCount] != (id)1)
            {
              v21 = self;
              uint64_t v22 = 5;
              goto LABEL_18;
            }
            v23 = [v9 hitRepWithTouch:*p_touch];
            v24 = [v23 repForDragging];

            if (!v24) {
              [(CRLiOSPreventScrollGestureRecognizer *)self setState:5];
            }
          }
        }
        id v16 = [v14 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (!v16)
        {
LABEL_21:

          v7 = v25;
          id v6 = v26;
          goto LABEL_22;
        }
      }
    }
  }
  [(CRLiOSPreventScrollGestureRecognizer *)self setState:5];
LABEL_22:
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSPreventScrollGestureRecognizer;
  [(CRLiOSPreventScrollGestureRecognizer *)&v9 touchesEnded:v6 withEvent:a4];
  if (self->_touch && objc_msgSend(v6, "containsObject:"))
  {
    touch = self->_touch;
    self->_touch = 0;
  }
  if (self->_secondTouch && objc_msgSend(v6, "containsObject:"))
  {
    secondTouch = self->_secondTouch;
    self->_secondTouch = 0;
  }
  if (!self->_touch && !self->_secondTouch) {
    [(CRLiOSPreventScrollGestureRecognizer *)self setState:3];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLiOSPreventScrollGestureRecognizer;
  [(CRLiOSPreventScrollGestureRecognizer *)&v9 touchesCancelled:v6 withEvent:a4];
  if (self->_touch && objc_msgSend(v6, "containsObject:"))
  {
    touch = self->_touch;
    self->_touch = 0;
  }
  if (self->_secondTouch && objc_msgSend(v6, "containsObject:"))
  {
    secondTouch = self->_secondTouch;
    self->_secondTouch = 0;
  }
  if (!self->_touch && !self->_secondTouch) {
    [(CRLiOSPreventScrollGestureRecognizer *)self setState:3];
  }
}

- (id)p_ICC
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveCanvasController);

  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondTouch, 0);
  objc_storeStrong((id *)&self->_touch, 0);

  objc_destroyWeak((id *)&self->_interactiveCanvasController);
}

@end