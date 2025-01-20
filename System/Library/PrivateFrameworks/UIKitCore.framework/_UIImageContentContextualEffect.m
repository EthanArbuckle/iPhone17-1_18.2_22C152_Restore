@interface _UIImageContentContextualEffect
+ (id)contextualEffectWithEffect:(void *)a3 source:;
- (double)variableValue;
- (id)_renditionWithRenditionResult:(double)a3 size:(double)a4;
- (id)_resolvedColorForNamedStyle:(id *)a1;
- (id)_resolvedHierarchicalColorForLayerLevel:(uint64_t)a1;
- (id)_resolvedPaletteColors;
- (id)vectorGlyph;
- (uint64_t)_shouldResolveHierarchicalColors;
- (uint64_t)_shouldResolveNamedColorStyles;
- (uint64_t)_shouldResolvePaletteColors;
@end

@implementation _UIImageContentContextualEffect

+ (id)contextualEffectWithEffect:(void *)a3 source:
{
  id v4 = a3;
  id v5 = a2;
  self;
  uint64_t v6 = objc_opt_new();
  objc_storeWeak((id *)(v6 + 16), v5);
  objc_storeWeak((id *)(v6 + 24), v4);
  uint64_t v7 = [v5 _symbolConfigurationForSource:v4];

  v8 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v7;

  return (id)v6;
}

- (id)_renditionWithRenditionResult:(double)a3 size:(double)a4
{
  uint64_t v7 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    id v9 = objc_loadWeakRetained((id *)(a1 + 24));
    if (v9)
    {
      a1 = objc_msgSend(WeakRetained, "_renditionForSource:size:symbolConfiguration:withRenditionResult:", v9, *(void *)(a1 + 8), v7, a3, a4);
    }
    else
    {
      v10 = -[_UIImageContentRenditionResult CGImageProvider](v7);
      v11 = -[_UIImageContentRenditionResult resultWithCGImageProvider:]((uint64_t)v7, v10);

      a1 = +[_UIImageContentRendition renditionWithResult:]((uint64_t)_UIImageContentRendition, v11);
    }
  }

  return (id)a1;
}

- (uint64_t)_shouldResolveNamedColorStyles
{
  uint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    id v3 = objc_loadWeakRetained((id *)(v1 + 24));
    id v4 = v3;
    if (v3
      && [v3 _isMultiColorSymbolImage]
      && [WeakRetained _effectiveRenderingModeForSource:v4 symbolConfiguration:*(void *)(v1 + 8)] == 1)
    {
      id v5 = [v4 _colorForFlattening];
      uint64_t v1 = v5 == 0;
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (uint64_t)_shouldResolveHierarchicalColors
{
  uint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    id v3 = objc_loadWeakRetained((id *)(v1 + 24));
    if (v3
      && [*(id *)(v1 + 8) _hasSpecifiedHierarchicalColors]
      && [v3 _isHierarchicalColorSymbolImage]
      && [WeakRetained _effectiveRenderingModeForSource:v3 symbolConfiguration:*(void *)(v1 + 8)] == 2)
    {
      id v4 = [v3 _colorForFlattening];
      uint64_t v1 = v4 == 0;
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (uint64_t)_shouldResolvePaletteColors
{
  uint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    id v3 = objc_loadWeakRetained((id *)(v1 + 24));
    if (v3 && [*(id *)(v1 + 8) _hasSpecifiedPaletteColors])
    {
      id v4 = [*(id *)(v1 + 8) _colors];
      if ((unint64_t)[v4 count] >= 2
        && [v3 _isPaletteColorSymbolImage]
        && [WeakRetained _effectiveRenderingModeForSource:v3 symbolConfiguration:*(void *)(v1 + 8)] == 2)
      {
        id v5 = [v3 _colorForFlattening];
        uint64_t v1 = v5 == 0;
      }
      else
      {
        uint64_t v1 = 0;
      }
    }
    else
    {
      uint64_t v1 = 0;
    }
  }
  return v1;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_source);
  objc_destroyWeak((id *)&self->_effect);
  objc_storeStrong((id *)&self->_symbolConfiguration, 0);
}

- (id)_resolvedPaletteColors
{
  uint64_t v1 = a1;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    uint64_t v1 = [v1[1] _paletteColorsWithEffect:WeakRetained];
  }
  return v1;
}

- (id)_resolvedHierarchicalColorForLayerLevel:(uint64_t)a1
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    id v5 = [*(id *)(a1 + 8) _hierarchicalColorForLayerLevel:a2 effect:WeakRetained];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)_resolvedColorForNamedStyle:(id *)a1
{
  if (a1)
  {
    a1 = [a1[1] _resolvedColorForNamedStyle:a2 effect:a1];
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)vectorGlyph
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    uint64_t v2 = WeakRetained;
    if (WeakRetained)
    {
      id v3 = [WeakRetained content];
      id v4 = [v3 vectorGlyph];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (double)variableValue
{
  if (!a1) {
    return 0.0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained variableValue];
    double v4 = v3;
  }
  else
  {
    double v4 = INFINITY;
  }

  return v4;
}

@end