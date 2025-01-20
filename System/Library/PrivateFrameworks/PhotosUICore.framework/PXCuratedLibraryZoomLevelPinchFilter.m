@interface PXCuratedLibraryZoomLevelPinchFilter
- (BOOL)isTrackingPinch;
- (PXCuratedLibraryZoomLevelPinchFilter)init;
- (void)filterPinchGestureWithScale:(double)a3 initialPinchHandler:(id)a4 subsequentDirectionChangeHandler:(id)a5;
- (void)reset;
@end

@implementation PXCuratedLibraryZoomLevelPinchFilter

- (PXCuratedLibraryZoomLevelPinchFilter)init
{
  v5.receiver = self;
  v5.super_class = (Class)PXCuratedLibraryZoomLevelPinchFilter;
  v2 = [(PXCuratedLibraryZoomLevelPinchFilter *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PXCuratedLibraryZoomLevelPinchFilter *)v2 reset];
  }
  return v3;
}

- (void)reset
{
  v3 = +[PXCuratedLibrarySettings sharedInstance];
  [v3 zoomLevelPinchSignificantScaleDelta];
  double v5 = v4;

  self->_isTrackingPinch = 0;
  self->_didHandleInitialPinch = 0;
  v6 = [(PXNumberFilter *)[PXInitialHysteresisNumberFilter alloc] initWithInput:1.0];
  initialDirectionFilter = self->_initialDirectionFilter;
  self->_initialDirectionFilter = v6;

  [(PXInitialHysteresisNumberFilter *)self->_initialDirectionFilter setHysteresis:v5];
  v8 = [[PXChangeDirectionNumberFilter alloc] initWithInput:1.0];
  scaleDirectionFilter = self->_scaleDirectionFilter;
  self->_scaleDirectionFilter = v8;

  v10 = self->_scaleDirectionFilter;
  [(PXChangeDirectionNumberFilter *)v10 setMinimumChange:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleDirectionFilter, 0);
  objc_storeStrong((id *)&self->_initialDirectionFilter, 0);
}

- (BOOL)isTrackingPinch
{
  return self->_isTrackingPinch;
}

- (void)filterPinchGestureWithScale:(double)a3 initialPinchHandler:(id)a4 subsequentDirectionChangeHandler:(id)a5
{
  v8 = (uint64_t (**)(id, uint64_t))a4;
  v9 = (void (**)(id, uint64_t))a5;
  scaleDirectionFilter = self->_scaleDirectionFilter;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __121__PXCuratedLibraryZoomLevelPinchFilter_filterPinchGestureWithScale_initialPinchHandler_subsequentDirectionChangeHandler___block_invoke;
  v18[3] = &__block_descriptor_40_e33_v16__0___PXMutableNumberFilter__8l;
  *(double *)&v18[4] = a3;
  [(PXNumberFilter *)scaleDirectionFilter performChanges:v18];
  [(PXNumberFilter *)self->_scaleDirectionFilter output];
  double v12 = v11;
  if (self->_isTrackingPinch)
  {
    if (self->_didHandleInitialPinch && v9 && v11 != self->_lastDirection)
    {
      if (v11 > 0.0) {
        uint64_t v13 = 1;
      }
      else {
        uint64_t v13 = -1;
      }
      v9[2](v9, v13);
    }
  }
  else
  {
    initialDirectionFilter = self->_initialDirectionFilter;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __121__PXCuratedLibraryZoomLevelPinchFilter_filterPinchGestureWithScale_initialPinchHandler_subsequentDirectionChangeHandler___block_invoke_2;
    v17[3] = &__block_descriptor_40_e33_v16__0___PXMutableNumberFilter__8l;
    *(double *)&v17[4] = a3;
    [(PXNumberFilter *)initialDirectionFilter performChanges:v17];
    [(PXNumberFilter *)self->_initialDirectionFilter output];
    if (v15 != 1.0)
    {
      self->_isTrackingPinch = 1;
      if (v15 > 1.0) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = -1;
      }
      self->_didHandleInitialPinch = v8[2](v8, v16);
    }
  }
  self->_lastDirection = v12;
}

uint64_t __121__PXCuratedLibraryZoomLevelPinchFilter_filterPinchGestureWithScale_initialPinchHandler_subsequentDirectionChangeHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setInput:*(double *)(a1 + 32)];
}

uint64_t __121__PXCuratedLibraryZoomLevelPinchFilter_filterPinchGestureWithScale_initialPinchHandler_subsequentDirectionChangeHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setInput:*(double *)(a1 + 32)];
}

@end