@interface SXTangierRepDirectLayerHostProvider
- (CALayer)aboveRepsLayerHost;
- (CALayer)overlayLayerHost;
- (CALayer)underRepsLayerHost;
- (id)directLayerHostForRep:(id)a3;
- (void)directLayerHostUpdateAdditionalLayersAboveRepLayers:(id)a3;
- (void)directLayerHostUpdateAdditionalLayersUnderRepLayers:(id)a3;
- (void)directLayerHostUpdateRepOverlayLayers:(id)a3;
- (void)setAboveRepsLayerHost:(id)a3;
- (void)setOverlayLayerHost:(id)a3;
- (void)setUnderRepsLayerHost:(id)a3;
@end

@implementation SXTangierRepDirectLayerHostProvider

- (id)directLayerHostForRep:(id)a3
{
  v3 = [a3 info];
  v4 = TSUProtocolCast();

  v5 = [v4 directLayerHost];

  return v5;
}

- (void)directLayerHostUpdateAdditionalLayersUnderRepLayers:(id)a3
{
  id v8 = a3;
  underRepsLayerHost = self->_underRepsLayerHost;
  if (underRepsLayerHost)
  {
    id v5 = [(CALayer *)underRepsLayerHost sublayers];
    if (v5 == v8)
    {
    }
    else
    {
      v6 = [(CALayer *)self->_underRepsLayerHost sublayers];
      char v7 = [v6 isEqual:v8];

      if ((v7 & 1) == 0) {
        [(CALayer *)self->_underRepsLayerHost setSublayers:v8];
      }
    }
  }
}

- (void)directLayerHostUpdateAdditionalLayersAboveRepLayers:(id)a3
{
  id v8 = a3;
  aboveRepsLayerHost = self->_aboveRepsLayerHost;
  if (aboveRepsLayerHost)
  {
    id v5 = [(CALayer *)aboveRepsLayerHost sublayers];
    if (v5 == v8)
    {
    }
    else
    {
      v6 = [(CALayer *)self->_aboveRepsLayerHost sublayers];
      char v7 = [v6 isEqual:v8];

      if ((v7 & 1) == 0) {
        [(CALayer *)self->_aboveRepsLayerHost setSublayers:v8];
      }
    }
  }
}

- (void)directLayerHostUpdateRepOverlayLayers:(id)a3
{
  id v8 = a3;
  overlayLayerHost = self->_overlayLayerHost;
  if (overlayLayerHost)
  {
    id v5 = [(CALayer *)overlayLayerHost sublayers];
    if (v5 == v8)
    {
    }
    else
    {
      v6 = [(CALayer *)self->_overlayLayerHost sublayers];
      char v7 = [v6 isEqual:v8];

      if ((v7 & 1) == 0) {
        [(CALayer *)self->_overlayLayerHost setSublayers:v8];
      }
    }
  }
}

- (CALayer)aboveRepsLayerHost
{
  return self->_aboveRepsLayerHost;
}

- (void)setAboveRepsLayerHost:(id)a3
{
}

- (CALayer)underRepsLayerHost
{
  return self->_underRepsLayerHost;
}

- (void)setUnderRepsLayerHost:(id)a3
{
}

- (CALayer)overlayLayerHost
{
  return self->_overlayLayerHost;
}

- (void)setOverlayLayerHost:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayLayerHost, 0);
  objc_storeStrong((id *)&self->_underRepsLayerHost, 0);
  objc_storeStrong((id *)&self->_aboveRepsLayerHost, 0);
}

@end