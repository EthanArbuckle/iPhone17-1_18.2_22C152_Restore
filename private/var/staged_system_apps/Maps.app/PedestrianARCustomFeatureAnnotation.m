@interface PedestrianARCustomFeatureAnnotation
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)isActive;
- (BOOL)isOccluded;
- (NSString)debugDescription;
- (PedestrianARCustomFeatureAnnotation)initWithCustomFeature:(id)a3 labelMarker:(id)a4 isActive:(BOOL)a5;
- (VKCustomFeature)feature;
- (VKLabelMarker)labelMarker;
- (void)setCoordinate:(id)a3;
@end

@implementation PedestrianARCustomFeatureAnnotation

- (PedestrianARCustomFeatureAnnotation)initWithCustomFeature:(id)a3 labelMarker:(id)a4 isActive:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v9)
  {
    v14 = sub_1005762E4();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[PedestrianARCustomFeatureAnnotation initWithCustomFeature:labelMarker:isActive:]";
      __int16 v23 = 2080;
      v24 = "PedestrianARDebugMapAnnotationsTask.m";
      __int16 v25 = 1024;
      int v26 = 86;
      __int16 v27 = 2080;
      v28 = "customFeature != nil";
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v15 = sub_1005762E4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v10)
  {
    v17 = sub_1005762E4();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "-[PedestrianARCustomFeatureAnnotation initWithCustomFeature:labelMarker:isActive:]";
      __int16 v23 = 2080;
      v24 = "PedestrianARDebugMapAnnotationsTask.m";
      __int16 v25 = 1024;
      int v26 = 87;
      __int16 v27 = 2080;
      v28 = "labelMarker != nil";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v18 = sub_1005762E4();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v22 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v20.receiver = self;
  v20.super_class = (Class)PedestrianARCustomFeatureAnnotation;
  v11 = [(PedestrianARCustomFeatureAnnotation *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_feature, a3);
    objc_storeStrong((id *)&v12->_labelMarker, a4);
    v12->_isActive = a5;
    v12->_isOccluded = [(VKLabelMarker *)v12->_labelMarker isOccluded];
  }

  return v12;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  [(VKLabelMarker *)self->_labelMarker coordinate];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSString)debugDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(PedestrianARCustomFeatureAnnotation *)self feature];
  v6 = [(PedestrianARCustomFeatureAnnotation *)self labelMarker];
  v7 = [(PedestrianARCustomFeatureAnnotation *)self labelMarker];
  v8 = [v7 arWalkingFeature];
  unsigned int v9 = [(PedestrianARCustomFeatureAnnotation *)self isActive];
  unsigned int v10 = [(PedestrianARCustomFeatureAnnotation *)self isOccluded];
  [(PedestrianARCustomFeatureAnnotation *)self coordinate];
  uint64_t v12 = v11;
  [(PedestrianARCustomFeatureAnnotation *)self coordinate];
  id v14 = [v3 initWithFormat:@"<\n%@: %p \n customFeature: %@ \n labelMarker: %@ \n arWalkingFeature: %@ \n isActive: %d \n isOccluded: %d \n coordinate: {%+.6f,%+.6f}\n>", v4, self, v5, v6, v8, v9, v10, v12, v13];

  return (NSString *)v14;
}

- (void)setCoordinate:(id)a3
{
  self->_coordinate = ($AB5116BA7E623E054F959CECB034F4E7)a3;
}

- (VKCustomFeature)feature
{
  return self->_feature;
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (BOOL)isOccluded
{
  return self->_isOccluded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelMarker, 0);

  objc_storeStrong((id *)&self->_feature, 0);
}

@end