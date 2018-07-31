<form class='form-horizontal' action=$SELF_URL method='get' id='region_form' name='region_form' role='form'>
  <input type=hidden name=index value=$index>
 
  <fieldset>
    <div class='box box-form'>
      <div class='box-header with-border'>
        <h4 class='box-title'>_{REGION}_</h4>
        <span class='pull-right'></span>
      </div>
      <div class='box-body'>
        <div class='form-group'>
          <label class='control-label col-md-3 text-left'  for='REGION'>_{REGION}_</label>
          <div class='col-md-9'>
            <input id='NAME' name='NAME' value='%NAME%' class='form-control' type='text' required>
          </div>
        </div>
        <div class='form-group' >
          <label class='control-label col-md-3 text-left'  for='COUNTRY'>_{COUNTRY}_</label>
          <div class='col-md-9'>
            %COUNTRY_SELECT%       
          </div>
        </div>
      </div>
      <div class='box-footer'>
        <input type=submit name=%ACTION% value='%LNG_ACTION%' class="btn btn-primary" >
      </div>
    </div>
  </fieldset>
</form>
