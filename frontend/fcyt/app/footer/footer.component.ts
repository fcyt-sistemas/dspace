
import { Component, OnInit } from '@angular/core';
import { FooterComponent as BaseComponent } from '../../../../app/footer/footer.component';
import { Observable } from 'rxjs';
import { TranslateLoader, TranslateModule } from '@ngx-translate/core';
/**
 * Represents the footer with the logo and simple navigation
 */
@Component({
  selector: 'ds-footer',
  styleUrls: ['footer.component.scss'],
  templateUrl: 'footer.component.html'
})

/*
import { Component, Optional } from '@angular/core';
import { hasValue } from '../shared/empty.util';
import { KlaroService } from '../shared/cookies/klaro.service';
import { environment } from '../../environments/environment';
import { Observable } from 'rxjs';
import { AuthorizationDataService } from '../core/data/feature-authorization/authorization-data.service';
import { FeatureID } from '../core/data/feature-authorization/feature-id';
*/

export class FooterComponent extends BaseComponent {
}


